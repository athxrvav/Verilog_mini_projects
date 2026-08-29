module topmodule (
    input clk,rst, 
    input [7:0] data_top,
    output [7:0] data_out_top);

wire[7:0] data_out_temp,data_out_fifo;
wire wr_enb,rd_enb,full,empty;



a moda ( data_top,clk,rst,data_out_temp,wr_enb) ;
fif0_8x8 fifo (clk,rst,wr_enb,rd_enb,data_out_temp,data_out_fifo,full,empty);
b modb (clk,rst,data_out_fifo,data_out_top,rd_enb);


endmodule