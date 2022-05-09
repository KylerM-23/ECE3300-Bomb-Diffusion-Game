`timescale 1ns / 1ps


module SevenSegOutputHandler(Clk400Hz, Right_1, Right_0, D5, D4, Cathode, Anode);
    input [5:0] Right_1, Right_0;
    input [6:0] D5,D4;
    input Clk400Hz;
    output [7:0] Anode;
    output [0:6] Cathode;
    
    wire [0:6] D0, D1, D2, D3, D4, D5, D6, D7;
    wire [2:0] S;
    wire [7:0] Anode;
    
    counter3bit(Clk400Hz, S);
    decoder3to8(S, Anode);
    
    Bin2Displays(Right_1, D3, D2);
    Bin2Displays(Right_0, D1, D0);
    
    Mux8(D0, D1, D2, D3,D4,D5,7'b1111111,7'b1111111, S, Cathode);
    
endmodule

module AudioHandler(G3, GO,GW, AP_2, AP_1, AP_0, ASD_2, ASD_1, ASD_0, Audio_pwm, Audio_sd);
    input G3, GO, GW, AP_2, AP_1, AP_0, ASD_2, ASD_1, ASD_0;
    output reg Audio_pwm, Audio_sd;
    
    always @ (*)
        begin
            if (G3)
                begin
                    Audio_pwm = AP_2;
                    Audio_sd = ASD_2;
                end
            else if (GO)
                begin
                    Audio_pwm = AP_1;
                    Audio_sd = ASD_1;
                end
            else if (GW)
                begin
                    Audio_pwm = AP_0;
                    Audio_sd = ASD_0;
                end
            else
                begin
                    Audio_pwm = 0;
                    Audio_sd = 0;
                end
        end
    
        
endmodule
