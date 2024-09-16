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
`REG_BUS_TYPEDEF_REQ(req_t, addr_t, data_t, strb_t);
`REG_BUS_TYPEDEF_RSP(rsp_t, data_t);
req_t to_reg_file_req;
rsp_t from_reg_file_rsp;

`REG_BUS_ASSIGN_TO_REQ(to_reg_file_req, axi_to_regfile);
`REG_BUS_ASSIGN_FROM_RSP(axi_to_regfile, from_reg_file_rsp);

reg_to_tlul i_reg2tlul (
    // TL-UL interface
    .tl_o(tl_o),
    .tl_i(tl_i),

    // Register interface
    .reg_req_i(to_reg_file_req),
    .reg_rsp_o(from_reg_file_rsp)
);

// Convert the REG_BUS interface to the struct signals used by autogenerated register file
// according the TileLink-Uncached-Lite protocol

spiker_adapter_reg_top u_spiker_reader (
    .clk_i(clk_i),
    .rst_ni(rst_ni),

    .intg_err_o(),
    .devmode_i(1'b1), // If 1, explicit error return for unmapped register access

    // From the protocol converters to regfile
    .tl_i(tl_i),
    .tl_o(tl_o),

    // From HW
    .reg2hw(reg_file_to_ip),
    .hw2reg(ip_to_reg_file)
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
//////////////////////////////////////////////////////////////////////////

// New signals to hold the values of reg_file_to_ip.op_a and reg_file_to_ip.op_b
logic [31:0] op_a_signal;
logic [31:0] op_b_signal;

// Assign the values of reg_file_to_ip.op_a and reg_file_to_ip.op_b to the new signals
assign op_a_signal = reg_file_to_ip.spikes[0].q;
assign op_b_signal = reg_file_to_ip.spikes[1].q;

// New signals to connect the outputs of spiker_reader
logic [31:0] spiker_data_out1;
logic [31:0] spiker_data_out2;

// Instantiate the VHDL module
spiker_reader u_spiker_reader (
    .data_in1(op_a_signal),
    .data_in2(op_b_signal),
    .data_out1(spiker_data_out1),
    .data_out2(spiker_data_out2)
);

endmodule : spiker_adapter
