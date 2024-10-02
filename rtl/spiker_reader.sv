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
    input logic sample_i,
    output logic sample_ready_o,
    output logic start_o
);

//assign sample_ready = reg_file_to_ip.ctrl1.sample_ready.q;    
//assign start = reg_file_to_ip.ctrl1.start.q;


logic [31:0] sample_count;
logic finished_sample;
logic [DATA_WIDTH-1:0] data_pipe;

always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
        sample_count <= 32'd0;
        finished_sample <= 1'b0;
    end else begin
        if (sample_i) begin
            if (sample_count == 24) begin
                finished_sample <= 1'b1;
            end else begin
                sample_count <= sample_count + 1;
                finished_sample <= 1'b0;
            end
        end
    end
end

typedef enum logic [1:0] {
    IDLE,
    START,
    SAMPLE
} state_t;

state_t state, next_state;

always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
        state <= IDLE;
    end else begin
        state <= next_state;
    end
end

always_comb begin
    next_state = state;
    case (state)
        IDLE: begin
            if (reg_file_to_ip.ctrl1.start.q) begin
                next_state = START;
            end
        end
        START: begin
            next_state = SAMPLE;
        end
        SAMPLE: begin
            if (finished_sample) begin
                next_state = IDLE;
            end
        end
    endcase
end

always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
        data_in_o <= '0;
        sample_ready_o <= 1'b0;
        start_o <= 1'b0;
        data_pipe <= '0;
    end else begin
        case (state)
            IDLE: begin
                sample_ready_o <= 1'b0;
                start_o <= 1'b0;
                for (int i = 0; i < N_REG; i = i + 1) begin
                    data_pipe[(i+1)*WIDTH-1 -: WIDTH] <= reg_file_to_ip.spikes[i].q;
                end
            end
            START: begin
                data_in_o <= data_pipe;
                sample_ready_o <= 1'b1;
                start_o <= 1'b1;
            end
            SAMPLE: begin
                if (sample_i) begin
                    data_pipe <= data_pipe << 4;
                    sample_ready_o <= 1'b1;
                end
            end
        endcase
    end
end


endmodule