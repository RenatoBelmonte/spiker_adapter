module spiker_writer
#(
    parameter int WIDTH = 32,
    parameter int N_SPIKES = 784,
    parameter int N_REG = 24,
    parameter int DATA_WIDTH = 768
) (
    input logic clk_i,
    input logic rst_ni,
    input logic test_mode_i,
    input  spiker_adapter_reg_pkg::spiker_adapter_hw2reg_file_t ip_to_reg_file,  
    input logic [WIDTH-1:0] data_out
);

    import spiker_adapter_reg_pkg::* ;

    // Concatenate all the values in reg_file_to_ip.spikes[] into a single DATA_WIDTH-wide signal
    logic [DATA_WIDTH-1:0] data_out;

    generate
        genvar i;
        for (i = 0; i < N_REG; i = i + 1) begin
            assign ip_to_reg_file.spikes_result[i].d = data_out[(i+1)*WIDTH-1 -: WIDTH];
        end
    endgenerate



endmodule