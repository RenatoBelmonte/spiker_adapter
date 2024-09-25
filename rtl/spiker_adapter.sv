`include "register_interface/typedef.svh"
`include "register_interface/assign.svh"

module spiker_adapter#(
    parameter int unsigned  AXI_ADDR_WIDTH = 32,
    localparam int unsigned AXI_DATA_WIDTH = 32,
    parameter int unsigned  AXI_ID_WIDTH,
    parameter int unsigned  AXI_USER_WIDTH
)(
    input logic clk_i,
    input logic rst_ni,
    input logic test_mode_i,

    AXI_BUS.Slave axi_slave
);

import spiker_adapter_reg_pkg::spiker_adapter_reg2hw_t;
import spiker_adapter_reg_pkg::spiker_adapter_hw2reg_t;

// Wiring signals
REG_BUS #(.ADDR_WIDTH(32), .DATA_WIDTH(32)) axi_to_regfile();
spiker_adapter_reg2hw_t reg_file_to_ip;
spiker_adapter_hw2reg_t ip_to_reg_file;

axi_to_reg_intf #(
    .ADDR_WIDTH(AXI_ADDR_WIDTH),
    .DATA_WIDTH(AXI_DATA_WIDTH),
    .ID_WIDTH(AXI_ID_WIDTH),
    .USER_WIDTH(AXI_USER_WIDTH),
    .DECOUPLE_W(0)
) i_axi2reg (
    .clk_i,
    .rst_ni,
    .testmode_i(test_mode_i),
    .in(axi_slave),
    .reg_o(axi_to_regfile)
);

// Convert the REG_BUS interface to the struct signals used by autogenerated register file
typedef logic [AXI_ADDR_WIDTH-1:0] addr_t;
typedef logic [AXI_DATA_WIDTH-1:0] data_t;
typedef logic [AXI_DATA_WIDTH/8-1:0] strb_t;
`REG_BUS_TYPEDEF_REQ(reg_req_t, addr_t, data_t, strb_t);
`REG_BUS_TYPEDEF_RSP(reg_rsp_t, data_t);
reg_req_t to_reg_file_req;
reg_rsp_t from_reg_file_rsp;

`REG_BUS_ASSIGN_TO_REQ(to_reg_file_req, axi_to_regfile);
`REG_BUS_ASSIGN_FROM_RSP(axi_to_regfile, from_reg_file_rsp);

    spiker_adapter_reg_top #(
    .reg_req_t(reg_req_t),
    .reg_rsp_t(reg_rsp_t)
    ) i_regfile (
                 .clk_i,
                 .rst_ni,
                 .devmode_i(1'b1),

                 //From the protocol converters to regfile
                 .reg_req_i(to_reg_file_req),
                 .reg_rsp_o(from_reg_file_rsp),

                 //Signals to spiker IP
                 .reg2hw(reg_file_to_ip),       // Write
                 .hw2reg(ip_to_reg_file)        // Read
    );


//////////////////////////////////////////////////////////////////////////
//                                                                      //
//                Instantiate the SPIKER READER module                  //
//                                                                      //
//////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////
// SPIKER_ADAPTER_REG_2_HW --> reg_file_to_ip :
//
// spiker_adapter_reg2hw_spikes_mreg_t [24:0]   spikes; // [803:4]
// spiker_adapter_reg2hw_ctrl1_reg_t            ctrl1;  // [3:0]
//
// spiker_adapter_reg2hw_spikes_mreg_t --> logic[31:0] q;
// 
// 
//////////////////////////////////////////////////////////////////////////
// SPIKER_ADAPTER_REG_2_HW --> reg_file_to_ip : 
//   spiker_adapter_hw2reg_spikes_result_mreg_t [24:0] spikes_result; // [801:2]
//   spiker_adapter_hw2reg_status_reg_t status; // [1:0] 
// 
//  spiker_adapter_hw2reg_spikes_result_mreg_t --> logic[31:0] d;
//////////////////////////////////////////////////////////////////////////
// New signals to hold the values of reg_file_to_ip.op_a and reg_file_to_ip.op_b


// logic [31:0] op_a_signal;
// logic [31:0] op_b_signal;
// 
// // Assign the values of reg_file_to_ip.op_a and reg_file_to_ip.op_b to the new signals
// assign op_a_signal = reg_file_to_ip.spikes[0].q;
// assign op_b_signal = reg_file_to_ip.spikes[1].q;
// 
// 
// // TO READ
// assign ip_to_reg_file.spikes_result[0].d = op_a_signal;
// assign ip_to_reg_file.spikes_result[1].d = op_b_signal;


// Calculate the DATA_WIDTH as the minimum number of 32-bit registers to hold all the 1-bit spikes
localparam N_SPIKES = 784;
localparam int N_REG = ((N_SPIKES + AXI_DATA_WIDTH - 1) / AXI_DATA_WIDTH) + 1;
localparam int DATA_WIDTH_SPIKE = N_REG * AXI_DATA_WIDTH;

logic [DATA_WIDTH_SPIKE-1:0] data_in;
logic [DATA_WIDTH_SPIKE-1:0] data_out;

logic ready;
logic sample_ready;
logic sample;

assign ready = reg_file_to_ip.ctrl1.ready.q;
assign sample_ready = reg_file_to_ip.ctrl1.sample_ready.q;    

spiker_writer #(
    .WIDTH(AXI_DATA_WIDTH),
    .N_SPIKES(N_SPIKES),
    .N_REG(N_REG),
    .DATA_WIDTH(DATA_WIDTH_SPIKE)
) u_spiker_writer (
    .clk_i(clk_i),
    .rst_ni(rst_ni),
    .test_mode_i(test_mode_i),
    .ip_to_reg_file(ip_to_reg_file),
    .data_out_i(data_out),
    .sample_i(sample)
);

spiker_reader #(
    .WIDTH(AXI_DATA_WIDTH),
    .N_SPIKES(N_SPIKES),
    .N_REG(N_REG),
    .DATA_WIDTH(DATA_WIDTH_SPIKE)
) u_spiker_reader (
    .clk_i(clk_i),
    .rst_ni(rst_ni),
    .test_mode_i(test_mode_i),
    .reg_file_to_ip(reg_file_to_ip),
    .data_in_o(data_in),
    .sample_i(sample)
); 

spiker_fake #(
    .N_SPIKES(N_SPIKES)
) u_spiker_fake (
    .clk_i(clk_i),
    .rst_ni(rst_ni),
    .data_in(data_in[N_SPIKES-1:0]),
    .data_out(data_out[N_SPIKES-1:0]),
    .ready_i(ready),
    .sample_ready_i(sample_ready),
    .sample_o(sample)
);

endmodule : spiker_adapter
