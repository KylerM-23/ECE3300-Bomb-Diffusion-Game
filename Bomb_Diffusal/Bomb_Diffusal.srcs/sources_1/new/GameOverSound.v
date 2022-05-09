`timescale 1ns / 1ps


module GameOverMusicSheet( input [9:0] number, 
	output reg [19:0] note,//max ? different musical notes
	output reg [4:0] duration);
	parameter   SIXTEENTH = 1;
	parameter   EIGTH = 2;
    parameter   QUARTER = 4;//2
    parameter	HALF = 8;
    parameter	ONE = 16;

    parameter   A4 = 113_636, C4=95_557, D4=85_131, E4 = 75_844, F4=71_586, G4 = 63_776, C5 = 47_778, SP = 1;  
    parameter   F5 = 71_633, D5 = 85_178, B4 = 101_214, E5 = 75_872, A5 = 56_818;
    parameter   G5 = 63_775, Gb5 = 60_168, Gb4 = 120_481;
    parameter A1 = 909090;
    parameter A2 = 454545;
    parameter B1 = 809847;
    parameter B2 = 404956;
    parameter C2 = 764409;
    parameter C3 = 382233;
    parameter D2 = 681013;
    parameter D3 = 340529;
    parameter E2 = 606722;
    parameter E3 = 303379;
    parameter Gb1 = 963205;
    parameter Gb2 = 481556;
    parameter A3 = 227272;
    parameter B3 = 202461;
    parameter Gb3 = 240801;
    
    always @ (number) begin
        case(number) //Tetris
            0: begin note = A1; duration = QUARTER; end
            1: begin note = B1; duration = QUARTER; end
            2: begin note = C2; duration = QUARTER; end
            3: begin note = E2; duration = QUARTER; end
            default: 	begin note = C4; duration = ONE; 	end
        endcase
    end
endmodule

module GameOverSongPlayer( input clock, input playSound, output reg audioOut, output wire aud_sd);
    reg [19:0] counter;
    reg [2:0] plays;
    reg [31:0] time1, noteTime;
    reg [9:0] msec;	//millisecond counter, and sequence number of musical note.
    wire [4:0] note, duration;
    wire [19:0] notePeriod;
    parameter clockFrequency = 100_000_000; 
    reg [9:0] number;

    assign aud_sd = 1'b1;

    GameOverMusicSheet 	GameOverSong(number, notePeriod, duration);
    
    always @ (posedge clock) 
      begin
        if(~playSound) 
            begin 
              counter <=0;  
              time1<=0;  
              number <=0;  
              audioOut <=1;
              plays <= 0;	
            end
        else if (plays == 4)
            audioOut <= 0;
        else 
            begin
                counter <= counter + 1; 
                time1<= time1+1;
                if( counter >= notePeriod) 
                    begin
                        counter <=0;  
                        audioOut <= ~audioOut ; 
                    end	//toggle audio output 	
                if( time1 >= noteTime) 
                    begin	
                        time1 <=0;  
                        number <= number + 1; 
                    end  //play next note
                if(number == 4) 
                    begin
                        number <=0; // Make the number reset at the end of the song
                        plays <= plays + 1;
                    end
            end
      end	
             
      always @(duration) noteTime <= duration * clockFrequency/16; 
           //number of   FPGA clock periods in one note.
endmodule   
