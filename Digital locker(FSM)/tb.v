`include "design.v"
module tb();

reg clk,rst,data_in,submit;
wire locked,unlocked;

locker dut (clk,rst,data_in,submit,locked,unlocked);

initial begin
    {clk,rst,data_in,submit} = 0;
end

always #5 clk=~clk;

initial begin
    @(negedge clk)
    rst = 1'b1;

    @(negedge clk)
    rst = 1'b0;
    data_in = 1'b1;

    @(negedge clk)
    data_in = 1'b0;

    @(negedge clk)
    data_in = 1'b1;

    @(negedge clk)
    data_in = 1'b0;
    submit = 1'b1;
    #20;
    $finish();
end
    
initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,tb);
end


endmodule
