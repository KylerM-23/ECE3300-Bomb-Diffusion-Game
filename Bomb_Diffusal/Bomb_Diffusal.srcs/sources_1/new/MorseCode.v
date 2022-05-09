`timescale 1ns / 1ps

module MorseBinary(input [3:0] digit, output reg [0:4] out);
    always @ (digit)
        begin
            case(digit)
                0: out = 'b11111;
                1: out = 'b01111;
                2: out = 'b00111;
                3: out = 'b00011;
                4: out = 'b00001;
                5: out = 'b00000;
                6: out = 'b10000;
                7: out = 'b11000;
                8: out = 'b11100;
                9: out = 'b11110;
                default: out = 0;
            endcase
        end
endmodule

module noteSelector(input [3:0] num, input [0:4] sequence, input p, output reg [31:0] note, output reg [3:0] duration);
    parameter A2 = 454545, A4 = 113_636;
    parameter QUARTER = 4, HALF = 8;
    
    always @ (num, sequence)
        if (p)
            begin
                note <= 0;
                duration <= HALF;
            end
        else
            begin
                if (sequence[num] == 0)
                    begin
                        note <= A2;
                        duration <= QUARTER;
                    end
                else
                    begin
                        note <= A4;
                        duration <= HALF;
                    end
            end
endmodule

module MorsePlayer(input [3:0] digit, input clock, input playSound, input reset, output reg start_note, output reg audioOut, output wire aud_sd);
    reg [31:0] counter;
    reg [31:0] time1, noteTime;
    reg [9:0] msec;	//millisecond counter, and sequence number of musical note.
    wire [3:0] duration;
    wire [31:0] notePeriod;
    parameter clockFrequency = 100_000_000; 
    reg [3:0] number;
    wire [4:0] seq;
   
    reg pause;
    
    assign aud_sd = 1'b1;
    
    MorseBinary MB(digit, seq);
    noteSelector(number, seq, pause, notePeriod, duration);
    
    always @ (posedge clock, posedge reset) 
      begin
        if(~playSound | reset) 
            begin 
                counter <=0;  
                time1<=0;  
                number <=0;  
                audioOut <=1;
                start_note <= 0;
            end
        else 
            begin
                counter <= counter + 1; 
                time1<= time1 + 1;
                
                if (!pause)
                    if( counter >= notePeriod) 
                        begin
                            counter <=0;  
                            audioOut <= ~audioOut ; 
                        end	//toggle audio output 	
                
                if( time1 >= noteTime) 
                    begin
                        start_note <=  0;	
                        time1 <=0;  
                        if (pause)
                            begin
                                number <= number + 1;
                                pause <= 0;
                             end
                         else
                            pause <= 1;
                    end  //play next note
                
                if(number == 5) 
                    begin
                        if (pause)
                            begin
                                start_note <= 1;
                                number <= 0;
                                pause <= 0;
                             end
                         else
                            pause <= 1;
                    end
            end
      end	
             
      always @(duration) noteTime <= duration * clockFrequency/16; 
endmodule   



