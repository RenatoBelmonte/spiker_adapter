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
    input  spiker_adapter_reg_pkg::spiker_adapter_reg2hw_t reg_file_to_ip,  
    output logic [WIDTH-1:0] data_in
);

    import spiker_adapter_reg_pkg::* ;

    // Concatenate all the values in reg_file_to_ip.spikes[] into a single DATA_WIDTH-wide signal
    logic [DATA_WIDTH-1:0] data_in;

    generate
        genvar i;
        for (i = 0; i < N_REG; i = i + 1) begin
            assign data_in[(i+1)*WIDTH-1 -: WIDTH] = reg_file_to_ip.spikes[i].q;
        end
    endgenerate



endmodule