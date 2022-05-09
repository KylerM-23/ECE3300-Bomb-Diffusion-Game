`timescale 1ns / 1ps

module Game(
    //Common I/O
        input [5:0] SW,
        output [5:0] LED,
        input RESET, START_BUTTON,
        input [3:0] BUTTON,
        
    //Clocks
        input CLK100MHZ, RESETCLK,
    
    //Display
        output [0:6] C,
        output [7:0] AN,
        
    //Game Stuff
        output wire [2:0] GameState,
        output Correct,START_NOTE,
        
    //Audio
        output AUD_PWM, AUD_SD
    );
    
    //Wires
        wire [5:0] GameConfig, Random;
        wire CLK400HZ, CLK2HZ, CLK1HZ, CLKSLOW;
        wire [5:0] MCount, SCount;
        wire [0:6] CodeDisplay, UserDisplay;
        wire [2:0] GWin;
        wire [3:0] GameEnable;
        wire Ready, GameWin, GameOver;
        wire AP_2, AP_1, AP_0, ASD_1, ASD_0, ASD_2;
    
    //Random Num    
        Random_Number_Gen(CLK100MHZ, RESET, START_BUTTON, GameConfig, Random,Ready);
        
    //Clocks
        ClkSignal1Hz(CLK100MHZ, RESETCLK, CLK1HZ);
        ClkSignalSlow(CLK100MHZ, RESETCLK, CLKSLOW);
        ClkSignal2Hz(CLK100MHZ, RESETCLK, CLK2HZ);
        ClkSignal400Hz(CLK100MHZ, RESETCLK, CLK400HZ);
        
        Timer(CLK100MHZ, CLK1HZ, RESET, Ready, MCount, SCount, GameWin, GameOver, GameOver);
        
    //Display
        SevenSegOutputHandler(CLK400HZ, MCount, SCount, CodeDisplay , UserDisplay, C, AN);
        
    //GameStuff
        Decoder_2_4(!GameWin & !GameOver, GameState, GameEnable);
        
        Game1(CLK2HZ, GameEnable[1], RESET, SW, Random, LED, GWin[0], Correct);
        Game2(CLKSLOW, GameEnable[2], RESET, BUTTON, GameConfig, CodeDisplay, UserDisplay, GWin[1]);
        Game3(CLK100MHZ, GameEnable[3], RESET, GWin[2], SW, AP_2, ASD_2, GWin[2], START_NOTE);

        Game_FSM(CLK100MHZ, RESET, Ready, GameOver, GWin, GameWin, GameState);
    
    //Audio
        GameOverSongPlayer(CLK100MHZ, GameOver, AP_1, ASD_1);
        GameWinSongPlayer(CLK100MHZ, GameWin, AP_0, ASD_0);
        AudioHandler(GameEnable[3], GameOver, GameWin, AP_2, AP_1, AP_0, ASD_2, ASD_1, ASD_0, AUD_PWM, AUD_SD);
        
endmodule

module Game3(
    input clk, enable, reset, feedbackwin,
    input [5:0] in,
    output audOut, audSD, win, led
    );
    
    wire [3:0] digit;
    BCDCounter(clk, enable, digit);
    MorsePlayer(digit, clk, enable & !feedbackwin, reset, led, audOut, audSD);
    MorseWinHandler(clk, reset, enable, digit, in, win);
    
endmodule


module BCDCounter(input clk, input enable, output reg [3:0] out);
    always @ (posedge clk)
        begin
            if (enable)
                out = out;
            else
                if (out == 9)
                    out = 0;
                else
                    out = out + 1;
        end
endmodule
module MorseWinHandler(
    input clk, reset,enable,
    input [3:0] random, 
    input [5:0] in,
    output reg win);
    reg game;
    
    always @ (posedge clk, posedge reset)
        begin
            if (reset)
                begin
                    win = 0;
                    game = 0;
                end
            else if (enable == 1)
                if (in[3:0] == random && game == 1 && in[4] == 1)
                    win = 1;
                else
                    game = 1;   
            else
                begin
                    win = 0;
                    game = 0;
                end
        end
endmodule


module Game_FSM (clk, r, ready, gameover, gwin, win, state_reg);
    localparam [2:0] Start = 3'b000, G1 = 3'b001, G2 = 3'b010, G3  = 3'b011, GameOver = 3'b100, GameWin = 3'b101;
    
    output reg [2:0] state_reg;
    reg [2:0] state_next;
    
    input clk, r, ready, gameover;
    output reg win;
    input [2:0] gwin;
    
    always @(posedge clk, posedge r)
        begin
            if (r)
                begin
                    state_reg <= Start;
                end
                
            else
                begin
                    state_reg <= state_next;
                end
        end
    
    always@*
        begin
            if (gameover)
                state_next = GameOver;
            else
                begin
                    state_next = state_reg;
                    win = 0;
                    case (state_reg)
                        Start:
                            begin              
                                if (ready)
                                    state_next = G1;
                            end
                        G1:
                            begin
                                if (gwin[0])
                                    state_next = G2;
                            end
                        
                        G2: 
                            begin
                                if (gwin[1])
                                    state_next = G3;
                            end
                        
                        G3:
                            if (gwin[2])
                                    state_next = GameWin;
                        
                        GameWin:
                            win = 1;
                        
                        GameOver:
                            win = 0;
                        default:  
                            state_next = Start;
                    endcase
                end
        end
endmodule