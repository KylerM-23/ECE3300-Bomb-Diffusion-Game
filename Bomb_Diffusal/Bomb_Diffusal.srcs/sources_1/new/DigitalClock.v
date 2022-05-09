`timescale 1ns / 1ps

module DigitalClock(Clk1Hz,L, R, SCount, MCount, En);
    input L, R, En, Clk1Hz;
    
    output [5:0] SCount, MCount;
    wire ClkMin;
    wire [5:0] MCount, SCount;
    
    timecounter(Clk1Hz & En, L, 20, R, SCount, ClkMin);
    timecounter(ClkMin & En, L, 1, R, MCount);

endmodule

module timecounter( Clk, L, LoadValue, Reset, Count, OutClock);
    input Clk, L, Reset;
    input [5:0] LoadValue;
    output reg [5:0] Count;
    output reg OutClock;
    
    always @ (posedge Clk, posedge L, posedge Reset)
        begin
            if (L)
                begin
                    Count <= LoadValue;
                end
            else if (Reset)
                Count <= 0;
            else
                begin
                    if (Count == 0)
                        begin
                            Count <= 59;
                            OutClock <= 1;
                        end
                    else
                        begin
                            Count <= Count - 1;
                            OutClock <= 0;
                        end
                end
        end
endmodule

module Bin2Displays(X, S2, S1);
    input [5:0] X;
    output [0:6] S1, S2;
    
    SevenSegController(X/10, S2);
    SevenSegController(X%10, S1);
endmodule


module decoder3to8(S, out);
    input [3:0] S;
    output reg [7:0] out;
    
    always @ (S)
        begin
            case(S)
                0: out = 'b1111_1110;
                1: out = 'b1111_1101;
                2: out = 'b1111_1011;
                3: out = 'b1111_0111;
                4: out = 'b1110_1111;
                5: out = 'b1101_1111;
                6: out = 'b1011_1111;
                7: out = 'b0111_1111;
            endcase
        end
endmodule
