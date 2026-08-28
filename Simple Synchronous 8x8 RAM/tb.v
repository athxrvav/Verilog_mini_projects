`include "design.v"
`timescale 1ns / 1ps

module tb_8x8_ram ();

reg clk,rst,wr_enb,rd_enb;
reg [3:0] wr_addr, rd_addr;
reg [7:0] data_in;
wire [7:0] data_out;

ram_8x8 dut (clk,rst,wr_enb,rd_enb,wr_addr,data_in,rd_addr,data_out);

initial begin
    {clk,rst,wr_enb,wr_addr,data_in,rd_enb,rd_addr} = 0;   
end

always #5 clk= ~clk;

initial begin
    rst = 1;
    #10;
    rst = 0;
    wr_enb = 1;
    wr_addr = 3'b100;
    data_in = 5;
    #10;

    wr_enb = 1;
    wr_addr = 3'b101;
    data_in = 10;
    #10;

    wr_enb = 0;
    rd_enb = 1;
    rd_addr = 3'b100;
    #10;
    rd_addr = 3'b101;
    
end
initial begin
    $dumpfile("waveforms.vcd"); 
    $dumpvars(0, tb_8x8_ram);          
    
    end

endmodule



