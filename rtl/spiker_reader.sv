import spiker_adapter_reg_pkg::* ;
module spiker_reader
#(
    parameter int WIDTH = 32,
    parameter int N_SPIKES = 784,
    parameter int N_REG = 24,
    parameter int DATA_WIDTH = 800
) (
    input logic clk_i,
    input logic rst_ni,
    input logic test_mode_i,
    input  spiker_adapter_reg_pkg::spiker_adapter_reg2hw_t reg_file_to_ip,  
    output logic [DATA_WIDTH-1:0] data_in_o,
    input logic sample_i
);


    // Concatenate all the values in reg_file_to_ip.spikes[] into a single DATA_WIDTH-wide signal
    always_ff @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
            data_in_o <= '0;
        end else begin
            for (int i = 0; i < N_REG; i = i + 1) begin
                data_in_o[(i+1)*WIDTH-1 -: WIDTH] <= reg_file_to_ip.spikes[i].q;
            end
            if (sample_i) begin
                data_in_o <= data_in_o >> 4;
            end
        end
    end

endmodule