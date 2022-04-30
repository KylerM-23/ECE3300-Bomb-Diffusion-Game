`timescale 1ns / 1ps

module Game(CLK100MHZ, RESET, START_BUTTON, SW, LED, C, AN, AUD_PWM, AUD_SD, GameState,GameWin, GameOver, BUTTON, RESETCLK);
    //Common I/O
        input [5:0] SW;
        output [5:0] LED;
        output AUD_PWM, AUD_SD;
        input RESET, START_BUTTON;
        input [3:0] BUTTON;
    
    //Random Num
        wire [5:0] GameConfig, Random;
        Random_Number_Gen(CLK100MHZ, RESET, START_BUTTON, GameConfig, Random,Ready);
        
    //Clocks
        input CLK100MHZ, RESETCLK;
        wire CLK400HZ, CLK2HZ, CLK1HZ, CLKSLOW;
        wire ReadyRise;
      
        ClkSignal1Hz(CLK100MHZ, RESETCLK, CLK1HZ);
        ClkSignalSlow(CLK100MHZ, RESETCLK, CLKSLOW);
        ClkSignal2Hz(CLK100MHZ, RESETCLK, CLK2HZ);
        ClkSignal400Hz(CLK100MHZ, RESETCLK, CLK400HZ);
        RisingEdge(CLK100MHZ, Ready, ReadyRise);
        
        Timer(CLK100MHZ, CLK1HZ, ReadyRise, RESET, Ready, MCount, SCount, GameWin, GameOver);
        
    //Display
        wire [5:0] MCount,SCount;
        wire [0:6] CodeDisplay, UserDisplay;
        output [0:6] C;
        output [7:0] AN;
        SevenSegOutputHandler(CLK400HZ, MCount, SCount, CodeDisplay , UserDisplay, C, AN);
        
    //GameStuff
        wire [2:0] GWin;
        output wire [2:0] GameState;
        output GameWin, GameOver;
        wire [3:0] GameEnable;
        wire Ready;
        
        Decoder_2_4(!GameWin & !GameOver, GameState[1:0], GameEnable);
        
        Game1(CLK2HZ, GameEnable[1], RESET, SW, Random, LED, GWin[0]);
        Game2(CLKSLOW, GameEnable[2], RESET, BUTTON, GameConfig, CodeDisplay, UserDisplay, GWin[1]);
        
        Game_FSM(CLK100MHZ, RESET, Ready, GameOver, GWin, GameWin, GameState);
    
    //Audio
        wire AP_1, AP_0, ASD_1, ASD_0;
        GameOverSongPlayer(CLK100MHZ, GameOver, AP_1, ASD_1);
        AudioHandler(CLK100MHZ, GameOver, GameWin, AP_1, AP_0, ASD_1, ASD_0, AUD_PWM, AUD_SD);
        
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
                state_reg <= Start;
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