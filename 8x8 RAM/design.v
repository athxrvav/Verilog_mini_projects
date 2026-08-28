module ram_8x8 ( 
    input clk,rst,wr_enb,rd_enb;
    input [3:0] wr_addr;
    input [7:0] data_in;
    input [3:0] rd_addr;
    output [7:0] data_out;
);
    //internal memory element
    reg [7:0] mem [7:0];

    integer i;
    
    //write and read logic
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            for(i=0;i<8;i=i+1) begin
                mem[i] <=0;
            end
        end
        
        else if(wr_enb) begin
            mem[wr_addr]<=data_in;
        end

        else (wr_enb == 0 & rd_enb==1) begin
            data_out <= mem[rd_addr];
        end       
    end
endmodule
