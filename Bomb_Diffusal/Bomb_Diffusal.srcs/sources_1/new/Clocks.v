`timescale 1ns / 1ps

module ClkSignal1Hz(clk, resetSW, outsignal);
    input clk;
    input resetSW;
    output outsignal;
    reg outsignal;
    reg [26:0] counter;
    
    always @ (posedge clk)
        begin
	       if (resetSW)
	           begin
		          counter=0;
		          outsignal=0;
	           end
	       else
                begin
	               counter = counter +1;
                   if (counter == 50_000_000) //Every .5s toggle
		              begin
			             outsignal=~outsignal;
			             counter =0;
                      end
                end
        end
endmodule

module ClkSignal2Hz(clk, resetSW, outsignal);
    input clk;
    input resetSW;
    output outsignal;
    reg outsignal;
    reg [26:0] counter;
    
    always @ (posedge clk)
        begin
	       if (resetSW)
	           begin
		          counter=0;
		          outsignal=0;
	           end
	       else
                begin
	               counter = counter +1;
                   if (counter == 100_000_000) //Every .5s toggle
		              begin
			             outsignal=~outsignal;
			             counter =0;
                      end
                end
        end
endmodule

module ClkSignalSlow(clk, resetSW, outsignal);
    input clk;
    input resetSW;
    output outsignal;
    reg outsignal;
    reg [26:0] counter;
    
    always @ (posedge clk)
        begin
	       if (resetSW)
	           begin
		          counter=0;
		          outsignal=0;
	           end
	       else
                begin
	               counter = counter +1;
                   if (counter == 12_500_000) //Every .5s toggle
		              begin
			             outsignal=~outsignal;
			             counter =0;
                      end
                end
        end
endmodule


module ClkSignal400Hz(clk, resetSW, outsignal);
    input clk;
    input resetSW;
    output  outsignal;
    reg [26:0] counter;  
    reg outsignal;
    
    always @ (posedge clk)
        begin
	       if (resetSW)
	           begin
		          counter=0;
		          outsignal=0;
	           end
	       else
                begin
	               counter = counter +1;
                   if (counter == 125_000) //Every .5s toggle
		              begin
			             outsignal=~outsignal;
			             counter =0;
                      end
                end
        end
endmodule
