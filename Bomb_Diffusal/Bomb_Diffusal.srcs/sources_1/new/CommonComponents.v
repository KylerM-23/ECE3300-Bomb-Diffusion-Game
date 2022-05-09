`timescale 1ns / 1ps


module RisingEdge (input wire clk, reset, level, output reg tick);
    localparam [1:0] zero=2'b00, edg=2'b01, one=2'b10;
    reg [1:0] state_reg, state_next;
    always @(posedge clk, posedge reset)
        if (reset)
            state_reg<=zero;
        else
            state_reg<=state_next;
    always@*
        begin
            state_next=state_reg;
            tick=1'b0; //default output
            case (state_reg)
                zero:
                    begin
                        tick=1'b0;
                        if (level)
                            state_next=edg;
                    end
                edg:
                    begin
                        tick=1'b1;
                        if (level)
                            state_next=one;
                        else
                            state_next=zero;
                    end
                one: 
                    if (~level)
                        state_next=zero;
                default:  
                    state_next=zero;
            endcase
        end
endmodule

module SevenSegController(X, out);
    input [5:0] X;
    output reg [0:6] out;
    
    always @ (X)
        begin
            case(X)
                0: out = 7'b0000001;
                1: out = 7'b1001111;
                2: out = 7'b0010010;
                3: out = 7'b0000110;
                4: out = 7'b1001100;
                5: out = 7'b0100100;
                6: out = 7'b0100000;
                7: out = 7'b0001111;
                8: out = 7'b0000000;
                9: out = 7'b0001100;
            endcase
       end
endmodule


module Mux8(x1,x2,x3,x4,x5,x6,x7,x8, S, out);
    input [0:6] x1, x2, x3, x4,x5,x6,x7,x8;
    input [2:0] S;
    output reg [0:6] out;
    
    always @(x1,x2,x3,x4,x5,x6,x7,x8,S)
        begin
            case (S)
                0: out = x1;
                1: out = x2;
                2: out = x3;
                3: out = x4;
                4: out = x5;
                5: out = x6;
                6: out = x7;
                7: out = x8;
            endcase
        end
endmodule

module counter3bit(Clk, out);
    input Clk;
    output reg [2:0] out;
    
    always @ (posedge Clk)
        begin
            out = out + 1;
        end
endmodule

module Decoder_2_4(enable, data, out);
    input [2:0] data;
    input enable;
    output reg [3:0] out;
    always @(data, enable)
        begin
            out = 0;
            if (enable)
                if (data < 4)
                    out[data] = 1;
        end
endmodule
