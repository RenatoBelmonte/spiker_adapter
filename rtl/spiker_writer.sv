import spiker_adapter_reg_pkg::* ;
module spiker_writer
#(
    parameter int WIDTH = 32,
    parameter int N_SPIKES = 784,
    parameter int N_REG = 24,
    parameter int DATA_WIDTH = 800
) (
    input logic clk_i,
    input logic rst_ni,
    input logic test_mode_i,
    input logic [DATA_WIDTH-1:0] data_out_i,
    input logic sample_i,
    output spiker_adapter_reg_pkg::spiker_adapter_hw2reg_t ip_to_reg_file
);

    // Concatenate all the values in reg_file_to_ip.spikes[] into a single DATA_WIDTH-wide signal
    assign ip_to_reg_file.status.d = sample_i;
    generate
        genvar i;
        for (i = 0; i < N_REG; i = i + 1) begin
            always_ff @(posedge clk_i or negedge rst_ni) begin
                if (!rst_ni) begin
                    ip_to_reg_file.spikes_result[i].d <= '0;
                end else if (sample_i) begin
                    ip_to_reg_file.spikes_result[i].d <= data_out_i[(i+1)*WIDTH-1 -: WIDTH];
                end
            end
        end
    endgenerate


endmodule