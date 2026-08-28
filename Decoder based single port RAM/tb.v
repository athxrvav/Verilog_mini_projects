module tb();

reg clk,rst,w_enb,r_enb;
reg[4:0] addr;
reg[7:0] temp_data;
wire [7:0] data ;
reg cs1,cs2,cs3,cs4;
reg[7:0] tb_data_in;

assign data = (w_enb) ? tb_data_in : 8'bz;

ram_8x8 dut1 (clk,rst,w_enb,cs1,r_enb,addr[2:0],data);
ram_8x8 dut2 (clk,rst,w_enb,cs2,r_enb,addr[2:0],data);
ram_8x8 dut3 (clk,rst,w_enb,cs3,r_enb,addr[2:0],data);
ram_8x8 dut4 (clk,rst,w_enb,cs4,r_enb,addr[2:0],data);

always @(*) begin
    case(addr[4:3])
    2'b00: begin 
        cs1<=1;
        cs2<=0;
        cs3<=0;
        cs4<=0;
    end

    2'b01:  begin 
        cs1<=0;
        cs2<=1;
        cs3<=0;
        cs4<=0;
    end
    2'b10: begin 
        cs1<=0;
        cs2<=0;
        cs3<=1;
        cs4<=0;
    end
    2'b11:  begin 
        cs1<=0;
        cs2<=0;
        cs3<=0;
        cs4<=1;
    end
    endcase

end

always #5 clk=~clk;

initial begin
    {clk,rst,cs1,cs2,cs3,cs4,w_enb,r_enb,tb_data_in,temp_data,addr} = 0;
end

initial begin
    @(negedge clk)
    rst = 1;
    @(negedge clk)
    rst = 0;
    @(negedge clk)
    w_enb = 1;
    addr = 5'b00_101;
    tb_data_in = 8'b0010_1010;
    @(negedge clk)
    w_enb = 1;
    addr = 5'b10_001;
    tb_data_in = 8'b1011_1111;
    @(negedge clk)
    w_enb= 0;
    r_enb =1;
    addr = 5'b00_101;
    @(negedge clk)
    w_enb= 0;
    r_enb =1;
    addr = 5'b10_001;
    
    #20;
    $finish();

end

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,tb);
end

endmodule

