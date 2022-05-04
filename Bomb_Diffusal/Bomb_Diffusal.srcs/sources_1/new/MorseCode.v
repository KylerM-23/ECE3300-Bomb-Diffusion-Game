`timescale 1ns / 1ps


module MorseCodeOneMusicSheet( input [3:0] number, 
	output reg [3:0] note,//max ? different musical notes
	output reg [4:0] duration);
    parameter   QUARTER = 4;//2
    parameter	HALF = 8;
    parameter	ONE = 16;

    parameter A2 = 454545, P = 10;
    
    always @ (number) begin
        case(number)
            0: begin note = A2; duration = QUARTER; end
            1: begin note = P; duration = QUARTER; end
            
            2: begin note = A2; duration = HALF; end
            3: begin note = P; duration = QUARTER; end
            
            4: begin note = A2; duration = HALF; end
            5: begin note = P; duration = QUARTER; end
            
            6: begin note = A2; duration = HALF; end
            7: begin note = P; duration = QUARTER; end
            
            8: begin note = A2; duration = HALF; end
            9: begin note = P; duration = ONE; end
            
            default: 	begin note = A2; duration = ONE; 	end
        endcase
    end
endmodule

module MorseCodeTwoMusicSheet( input [3:0] number, 
	output reg [3:0] note,//max ? different musical notes
	output reg [4:0] duration);
    parameter   QUARTER = 4;//2
    parameter	HALF = 8;
    parameter	ONE = 16;

    parameter A2 = 454545, P = 10;
    
    always @ (number) begin
        case(number)
            0: begin note = A2; duration = QUARTER; end
            1: begin note = P; duration = QUARTER; end
            
            2: begin note = A2; duration = QUARTER; end
            3: begin note = P; duration = QUARTER; end
            
            4: begin note = A2; duration = HALF; end
            5: begin note = P; duration = QUARTER; end
            
            6: begin note = A2; duration = HALF; end
            7: begin note = P; duration = QUARTER; end
            
            8: begin note = A2; duration = HALF; end
            9: begin note = P; duration = ONE; end
            
            default: 	begin note = A2; duration = ONE; 	end
        endcase
    end
endmodule

module MorseCodeThreeMusicSheet( input [3:0] number, 
	output reg [3:0] note,//max ? different musical notes
	output reg [4:0] duration);
    parameter   QUARTER = 4;//2
    parameter	HALF = 8;
    parameter	ONE = 16;

    parameter A2 = 454545, P = 10;
    
    always @ (number) begin
        case(number)
            0: begin note = A2; duration = QUARTER; end
            1: begin note = P; duration = QUARTER; end
            
            2: begin note = A2; duration = QUARTER; end
            3: begin note = P; duration = QUARTER; end
            
            4: begin note = A2; duration = QUARTER; end
            5: begin note = P; duration = QUARTER; end
            
            6: begin note = A2; duration = HALF; end
            7: begin note = P; duration = QUARTER; end
            
            8: begin note = A2; duration = HALF; end
            9: begin note = P; duration = ONE; end
            
            default: 	begin note = A2; duration = ONE; 	end
        endcase
    end
endmodule

module MorseCodeFourMusicSheet( input [3:0] number, 
	output reg [3:0] note,//max ? different musical notes
	output reg [4:0] duration);
    parameter   QUARTER = 4;//2
    parameter	HALF = 8;
    parameter	ONE = 16;

    parameter A2 = 454545, P = 10;
    
    always @ (number) begin
        case(number)
            0: begin note = A2; duration = QUARTER; end
            1: begin note = P; duration = QUARTER; end
            
            2: begin note = A2; duration = QUARTER; end
            3: begin note = P; duration = QUARTER; end
            
            4: begin note = A2; duration = QUARTER; end
            5: begin note = P; duration = QUARTER; end
            
            6: begin note = A2; duration = QUARTER; end
            7: begin note = P; duration = QUARTER; end
            
            8: begin note = A2; duration = HALF; end
            9: begin note = P; duration = ONE; end
            
            default: 	begin note = A2; duration = ONE; 	end
        endcase
    end
endmodule

module MorseCodeFiveMusicSheet( input [3:0] number, 
	output reg [3:0] note,//max ? different musical notes
	output reg [4:0] duration);
    parameter   QUARTER = 4;//2
    parameter	HALF = 8;
    parameter	ONE = 16;

    parameter A2 = 454545, P = 10;
    
    always @ (number) begin
        case(number)
            0: begin note = A2; duration = QUARTER; end
            1: begin note = P; duration = QUARTER; end
            
            2: begin note = A2; duration = QUARTER; end
            3: begin note = P; duration = QUARTER; end
            
            4: begin note = A2; duration = QUARTER; end
            5: begin note = P; duration = QUARTER; end
            
            6: begin note = A2; duration = QUARTER; end
            7: begin note = P; duration = QUARTER; end
            
            8: begin note = A2; duration = QUARTER; end
            9: begin note = P; duration = ONE; end
            
            default: 	begin note = A2; duration = ONE; 	end
        endcase
    end
endmodule

module MorseCodeSixMusicSheet( input [3:0] number, 
	output reg [3:0] note,//max ? different musical notes
	output reg [4:0] duration);
    parameter   QUARTER = 4;//2
    parameter	HALF = 8;
    parameter	ONE = 16;

    parameter A2 = 454545, P = 10;
    
    always @ (number) begin
        case(number)
            0: begin note = A2; duration = HALF; end
            1: begin note = P; duration = QUARTER; end
            
            2: begin note = A2; duration = QUARTER; end
            3: begin note = P; duration = QUARTER; end
            
            4: begin note = A2; duration = QUARTER; end
            5: begin note = P; duration = QUARTER; end
            
            6: begin note = A2; duration = QUARTER; end
            7: begin note = P; duration = QUARTER; end
            
            8: begin note = A2; duration = QUARTER; end
            9: begin note = P; duration = ONE; end
            
            default: 	begin note = A2; duration = ONE; 	end
        endcase
    end
endmodule

module MorseCodeSevenMusicSheet( input [3:0] number, 
	output reg [3:0] note,//max ? different musical notes
	output reg [4:0] duration);
    parameter   QUARTER = 4;//2
    parameter	HALF = 8;
    parameter	ONE = 16;

    parameter A2 = 454545, P = 10;
    
    always @ (number) begin
        case(number)
            0: begin note = A2; duration = HALF; end
            1: begin note = P; duration = QUARTER; end
            
            2: begin note = A2; duration = HALF; end
            3: begin note = P; duration = QUARTER; end
            
            4: begin note = A2; duration = QUARTER; end
            5: begin note = P; duration = QUARTER; end
            
            6: begin note = A2; duration = QUARTER; end
            7: begin note = P; duration = QUARTER; end
            
            8: begin note = A2; duration = QUARTER; end
            9: begin note = P; duration = ONE; end
            
            default: 	begin note = A2; duration = ONE; 	end
        endcase
    end
endmodule

module MorseCodeEightMusicSheet( input [3:0] number, 
	output reg [3:0] note,//max ? different musical notes
	output reg [4:0] duration);
    parameter   QUARTER = 4;//2
    parameter	HALF = 8;
    parameter	ONE = 16;

    parameter A2 = 454545, P = 10;
    
    always @ (number) begin
        case(number)
            0: begin note = A2; duration = HALF; end
            1: begin note = P; duration = QUARTER; end
            
            2: begin note = A2; duration = HALF; end
            3: begin note = P; duration = QUARTER; end
            
            4: begin note = A2; duration = HALF; end
            5: begin note = P; duration = QUARTER; end
            
            6: begin note = A2; duration = QUARTER; end
            7: begin note = P; duration = QUARTER; end
            
            8: begin note = A2; duration = QUARTER; end
            9: begin note = P; duration = ONE; end
            
            default: 	begin note = A2; duration = ONE; 	end
        endcase
    end
endmodule

module MorseCodeNineMusicSheet( input [3:0] number, 
	output reg [3:0] note,//max ? different musical notes
	output reg [4:0] duration);
    parameter   QUARTER = 4;//2
    parameter	HALF = 8;
    parameter	ONE = 16;

    parameter A2 = 454545, P = 10;
    
    always @ (number) begin
        case(number)
            0: begin note = A2; duration = HALF; end
            1: begin note = P; duration = QUARTER; end
            
            2: begin note = A2; duration = HALF; end
            3: begin note = P; duration = QUARTER; end
            
            4: begin note = A2; duration = HALF; end
            5: begin note = P; duration = QUARTER; end
            
            6: begin note = A2; duration = HALF; end
            7: begin note = P; duration = QUARTER; end
            
            8: begin note = A2; duration = QUARTER; end
            9: begin note = P; duration = ONE; end
            
            default: 	begin note = A2; duration = ONE; 	end
        endcase
    end
endmodule

module MorseCodeZeroMusicSheet( input [3:0] number, 
	output reg [3:0] note,//max ? different musical notes
	output reg [4:0] duration);
    parameter   QUARTER = 4;//2
    parameter	HALF = 8;
    parameter	ONE = 16;

    parameter A2 = 454545, P = 10;
    
    always @ (number) begin
        case(number)
            0: begin note = A2; duration = HALF; end
            1: begin note = P; duration = QUARTER; end
            
            2: begin note = A2; duration = HALF; end
            3: begin note = P; duration = QUARTER; end
            
            4: begin note = A2; duration = HALF; end
            5: begin note = P; duration = QUARTER; end
            
            6: begin note = A2; duration = HALF; end
            7: begin note = P; duration = QUARTER; end
            
            8: begin note = A2; duration = HALF; end
            9: begin note = P; duration = ONE; end
            
            default: 	begin note = A2; duration = ONE; 	end
        endcase
    end
endmodule

module MorsePlayer( input[3:0] digit1, input[3:0] digit0, input clock, input playSound, output reg audioOut, output wire aud_sd);
    reg [3:0] counter;
    reg [31:0] time1, noteTime;
    reg [9:0] msec;	//millisecond counter, and sequence number of musical note.
    wire [3:0] duration;
    wire [3:0] notePeriod;
    parameter clockFrequency = 100_000_000; 
    reg [9:0] number;
    
    wire [3:0] D;
    reg digitBit;
    
    assign aud_sd = 1'b1;
    assign D = digitBit ? digit1 : digit0;
    
    wire [3:0] MN0,MN1,MN2,MN3,MN4,MN5,MN6,MN7,MN8, MN9;
	wire [4:0] MD0,MD1,MD2,MD3,MD4,MD5,MD6,MD7,MD8, MD9;
	
	
    MorseCodeZeroMusicSheet M0(number, MN0, MD0);
    MorseCodeOneMusicSheet M1(number, MN1, MD1);
    MorseCodeTwoMusicSheet M2(number, MN2, MD2);
    MorseCodeThreeMusicSheet M3(number, MN3, MD3);
    MorseCodeFourMusicSheet M4(number, MN4, MD4);
    MorseCodeFiveMusicSheet M5(number, MN5, MD5);
    MorseCodeSixMusicSheet M6(number, MN6, MD6);
    MorseCodeSevenMusicSheet M7(number, MN7, MD7);
    MorseCodeEightMusicSheet M8(number, MN8, MD8);
    MorseCodeNineMusicSheet M9(number, MN9, MD9);
    
    MusicMux MX(MN0,MN1,MN2,MN3,MN4,MN5,MN6,MN7,MN8,MN9,MD0,MD1,MD2,MD3,MD4,MD5,MD6,MD7,MD8,MD9,D,notePeriod, duration);
    
    always @ (posedge clock) 
      begin
        if(~playSound) 
            begin 
              counter <=0;  
              time1<=0;  
              number <=0;  
              audioOut <=1;
            end
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
                if(number == 10) 
                    begin
                        digitBit <= ~digitBit;
                        number <=0; // Make the number reset at the end of the song
                    end
            end
      end	
             
      always @(duration) noteTime = duration * clockFrequency/16; 
endmodule   

module MusicMux(
    input [3:0] MN0,MN1,MN2,MN3,MN4,MN5,MN6,MN7,MN8, MN9,
	input [4:0] MD0,MD1,MD2,MD3,MD4,MD5,MD6,MD7,MD8, MD9,
	input [3:0] digit,
	output reg [3:0] Note,
	output reg [4:0] Duration
    );
    
    always @ (*)
        begin
            case (digit)
                0: begin Note = MN0; Duration = MD0; end
                1: begin Note = MN1; Duration = MD1; end
                2: begin Note = MN2; Duration = MD2; end
                3: begin Note = MN3; Duration = MD3; end
                4: begin Note = MN4; Duration = MD4; end
                5: begin Note = MN5; Duration = MD5; end
                6: begin Note = MN6; Duration = MD6; end
                7: begin Note = MN7; Duration = MD7; end
                8: begin Note = MN8; Duration = MD8; end
                9: begin Note = MN9; Duration = MD9; end
                default begin Note = 0; Duration = 0; end
            endcase
        end

endmodule
