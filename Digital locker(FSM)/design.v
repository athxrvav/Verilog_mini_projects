
//password = 1010;

module locker #(
    parameter idle = 3'b000,
    parameter error_state = 3'b001,
    parameter s1 = 3'b010,
    parameter s2 = 3'b011,
    parameter s3 = 3'b100,
    parameter unlock_state = 3'b101
    
) (
    input clk,rst,data_in,submit,
    output reg locked, unlocked
);

reg [2:0] present_state,next_state;
reg[1:0] error_count;
always @(posedge clk or posedge rst) begin
    if(rst) begin
        present_state<=idle;
        error_count<=0;
    end
    else begin
    present_state<=next_state;  
    end
    if(present_state == error_state) begin
        error_count = error_count +1'b1;
    end
    else if(present_state == unlock_state) begin
        error_count = 0;
    end

end

always @(*) begin
    next_state = present_state;
    locked = 1'b1;
    unlocked = 1'b0;

    case(present_state)
        idle: begin
            if(data_in ==1'b1 && error_count<3)
            next_state = s1;
            else next_state= error_state;
        end

        s1: begin
            if(data_in == 1'b0 && error_count<3)
            next_state = s2;
            else next_state= error_state;
        end

        s2: begin
            if(data_in == 1'b1 && error_count<3)
            next_state=s3;
            else next_state=error_state;
        end
        s3: begin
            if(data_in == 1'b0 && error_count<3)
            next_state=unlock_state;
            else next_state = error_state;
        end

        unlock_state: begin
            locked = 0;
            unlocked = 1;

            if(submit)
            next_state = idle;
            else next_state = unlock_state;
        end

        error_state: begin
            unlocked = 0;
            locked = 1;

            if(submit)
            next_state = idle;
            else next_state=error_state;
        end
    endcase

end

endmodule

    
