module fif0_8x8 (
    input clk,rst,wr_enb,rd_enb,
    input [7:0] data_in,
    output reg [7:0] data_out, 
    output full,empty
);

reg [2:0] wr_ptr=0;
reg [2:0] rd_ptr=0;

reg [7:0] mem [7:0];
integer i;

always @(posedge clk) begin
    if(rst) begin
        for(i=0;i<8;i=i+1) begin
            mem[i]<=0;
        end
    end
    else begin
    if(wr_enb == 1 && full==0) begin
        mem[wr_ptr] <=data_in;
        wr_ptr <= wr_ptr+1'b1;
    end
    if(rd_enb==1 && empty==0 ) begin
        data_out <= mem[rd_ptr];
        rd_ptr <= rd_ptr+1'b1;
    end
    end
end

assign full = ((wr_ptr + 1'b1)==(rd_ptr))?1:0;
assign empty = (wr_ptr==rd_ptr)?1:0;

        
    
endmodule
