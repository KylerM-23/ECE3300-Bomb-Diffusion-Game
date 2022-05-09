`timescale 1ns / 1ps

module AlarmHandler(Clk, CMin, CSec, AMin,ASec, En, Sn, Signal);
    input [5:0] CMin, CSec, AMin, ASec;
    input En, Sn, Clk;
    output reg Signal;
    reg active;
    
    always @ (posedge Clk, posedge Sn)
        begin
            if (Sn)
                begin
                    Signal = 0;
                    active = 0;
                end
            
           else if (En)
                begin
                    if (CMin == AMin && CSec == ASec)
                        begin        
                            Signal = 1;
                            active = 1;
                        end
                end
            else
                begin
                    Signal = 0;
                    active = 0;
                end
        end
endmodule
