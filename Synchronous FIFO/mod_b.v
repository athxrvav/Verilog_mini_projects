module b #(
    parameter idle = 2'b00 ,
    parameter s1 = 2'b01,
    parameter data_state = 2'b10
)(
    input clk,rst,
    input [7:0] data_in,
    output reg [7:0] data_out,
    output reg rd_enb
);
    
    reg [1:0] ps,ns;

    always @(posedge clk) begin
        if(rst) begin
            ps<=idle;
        end
        else begin
            ps<=ns;
        end
    end

    always @(*) begin
        case(ps) 
            idle: begin
                ns = s1;
                rd_enb = 0;
            end
            s1: begin
                ns = data_state;
            end
            data_state: begin
                ns = idle;
                data_out = data_in;
                rd_enb = 1;
            end
        endcase
    end




endmodule