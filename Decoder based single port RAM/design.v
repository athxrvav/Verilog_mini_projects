module ram_8x8 (
    input clk,rst,w_enb,cs,r_enb,
    input[2:0] addr,
    inout[7:0] data
);

reg [7:0] mem [7:0];
reg [7:0] temp_data;
integer i;


always@(posedge clk) begin
    if(rst) begin
        for(i=0;i<8;i=i+1) begin
        mem[i] <= 0;
        end
    end
    if(cs) begin
     if (w_enb) begin
        mem[addr] <= data;
    end
    else if(r_enb) begin
        temp_data<= mem[addr];
    end
    end
    
end
assign data = (cs&~w_enb&r_enb)?temp_data: 'bz;


    
endmodule

