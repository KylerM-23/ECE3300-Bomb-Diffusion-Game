`timescale 1ns / 1ps

module Timer(clk, clk1hz, Reset, enable, MCount, SCount, GameWin,GameOverIn, GameOver);
    input clk, clk1hz, Reset, enable, GameWin, GameOverIn;
    output [5:0] MCount, SCount;
    output GameOver;
    wire Load;
    LoadCheck(clk, enable, Reset, Load);
    DigitalClock(clk1hz & !GameOverIn & !GameWin, Load, Reset, SCount, MCount, enable);
    AlarmHandler(clk1hz & !GameOverIn & !GameWin, MCount, SCount, 0, 1, enable | !GameWin, Reset, GameOver);
    
endmodule

module LoadCheck(clk, in, reset, out);
    input clk, reset, in;
    output reg out;
    reg load;
    
    always @ (posedge clk, posedge reset)
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