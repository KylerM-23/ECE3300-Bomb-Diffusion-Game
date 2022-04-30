`timescale 1ns / 1ps

module Game1(
    input clk, enable, reset,
    input [5:0] in, Random,
    output reg [5:0] out,
    output reg win
    );
    reg Game;
    reg [2:0] Wins;    
    always @(posedge clk)
        begin
            if (reset)
                begin
                    out = 0;
                    win = 0;
                    Game = 0;
                    Wins = 0;
                end
                
            if (enable == 1 && win == 0)
                if (in == out && Game == 1)
                    begin
                        out = 'b111111;
                        Wins = Wins + 1;
                        if (Wins == 5)
                            win = 1;
                    end
                else
                    begin
                        out = Random;
                        win = 0;
                        Game = 1;
                    end
            else if (enable == 1 && win == 1)
                out = 0;
            else
                begin
                    out = 0;
                    win = 0;
                    Game = 0;
                end
        end
endmodule

module Game2(
    input clk, enable, reset,
    input [3:0] in, Random,
    output reg [6:0] code, user,
    output reg win
    );
    reg Game;
      
    always @(posedge clk)
        begin
            if (reset)
                begin
                    code = 7'b11111111;
                    user = 7'b1111111;
                    win = 0;
                    Game = 0;
                end
                
            if (enable == 1 && win == 0)
                begin
                    if(in[0])
                        user = user >> 1;
                    else if(in[1])
                        user = user << 1;
                    
                    else if(in[2])
                        user = user - 1;
                    
                    else if(in[3])
                        user = user + 1;
                    
                    if (user == code && Game == 1)
                        begin
                            code = 7'b1111111;
                            win = 1;
                        end
                    else
                        begin
                            if (Game == 0)
                                code = Random;
                            win = 0;
                            Game = 1;
                        end
                end
            else if (enable == 1 && win == 1)
                begin
                    code = 7'b1111111;
                    user = 7'b1111111;
                end
            else
                begin
                    code = 7'b1111111;
                    user = 7'b1111111;
                    win = 0;
                    Game = 0;
                end
        end
endmodule
