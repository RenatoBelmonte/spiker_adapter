module spiker_unwrap
#(
    parameter int WIDTH = 32,
    parameter int N_SPIKES = 784
) (
    input logic clk_i,
    input logic rst_ni,
    input logic test_mode_i,
    input  spiker_adapter_reg_pkg::spiker_adapter_reg2hw_t reg_file_to_ip,  
    output spiker_adapter_reg_pkg::spiker_adapter_hw2reg_t ip_to_reg_file
);

  import spiker_adapter_reg_pkg::* ;

    // Define the DATA_WIDTH based on the number of spikes and their width
    localparam real width_real = N_SPIKES / WIDTH;
    localparam int DATA_WIDTH = int'(N_SPIKES / WIDTH);
      if (width_real < int'(width_real)) begin
        DATA_WIDTH = DATA_WIDTH + 1;
    end


    // Concatenate all the values in reg_file_to_ip.spikes[] into a single DATA_WIDTH-wide signal
    logic [DATA_WIDTH-1:0] data_in;
    logic [DATA_WIDTH-1:0] data_in;

    generate
        genvar i;
        for (i = 0; i < N_SPIKES; i = i + 1) begin
            assign data_in[(i+1)*WIDTH-1 -: WIDTH] = reg_file_to_ip.spikes[i].q;
            assign data_out[(i+1)*WIDTH-1 -: WIDTH] = ip_to_reg_file.spikes_result[i].d; 
        end
    endgenerate



    // Instantiate spiker_reader module
    spiker_reader #(
        .N_SPIKES(N_SPIKES)
    )u_spiker_reader
    (
        .clk_i(clk_i),
        .rst_ni(rst_ni),
        .data_in(data_in[N_SPIKES-1 : 0]),
        .data_out(data_out[N_SPIKES-1 : 0]) 
    );



endmodule