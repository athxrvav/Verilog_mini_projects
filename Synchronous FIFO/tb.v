`include "mod_a.v"
`include "mod_b.v"
`include "fifo.v"
`include "top_fifo.v"



module tb;

reg clk,rst;
reg [7:0] data_in;
wire [7:0] data_out;

topmodule dut (clk,rst,data_in,data_out);


initial begin
    {clk,rst,data_in} = 0;
end
 always #5 clk=~clk;    

initial begin
    #10 rst = 1;
    #10;
     rst = 0;
     data_in = 5;
    #10;
     data_in = 10;
    #10
    data_in = 5;
    #100 $finish();
end
initial begin
    $dumpfile ("waveform.vcd");
    $dumpvars (0,tb);
end


endmodule