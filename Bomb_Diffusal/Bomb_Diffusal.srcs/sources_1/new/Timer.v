`timescale 1ns / 1ps

module Timer(clk, clk1hz, Ready, Reset, enable, MCount, SCount, GameWin, GameOver);
    input clk, clk1hz, Ready, Reset, enable, GameWin;
    output [5:0] MCount, SCount;
    output GameOver;
    wire Load;
    
    LoadCheck(clk, enable, Reset, Load);
    DigitalClock(clk1hz & !GameOver, Load, Reset, SCount, MCount, enable);
    AlarmHandler(clk1hz & !GameOver, MCount, SCount, 0, 1, enable | !GameWin, reset, GameOver);
    
endmodule

module LoadCheck(clk, in, reset, out);
    input clk, reset, in;
    output reg out;
    reg load;
    
    always @ (posedge clk)
        begin
            if (reset)
                begin
                    out = 0;
                    load = 0;
                end
            else
                begin
                    out = 0;
                    if (in == 1 & load == 0)
                        begin
                            out = 1;
                            load = 1;
                        end
                end
        end
endmodule