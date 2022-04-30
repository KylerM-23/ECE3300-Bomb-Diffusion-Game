`timescale 1ns / 1ps

module Random_Number_Gen(Clk, Reset, In, Num, Rand,Ready);
    input Reset, Clk, In;
    output Ready;
    output [5:0] Num, Rand;
    
    wire IN_Rising;
    RisingEdge(Clk, Reset, In, IN_Rising);
    Random_Number_Generator_FMSD (Clk, Reset, Num,Rand, IN_Rising, Ready);
    
endmodule

module Random_Number_Generator_FMSD (clk, r, num, num_reg, In, R);
    localparam [1:0] Start=2'b00, Seed = 2'b01, LFSR = 2'b10, Ready  = 2'b11;
    
    reg [1:0] state_reg;
    reg [1:0] state_next;
    
    output reg [5:0] num_reg;
    reg [5:0] num_next;
    
    input clk, In, r;
    
    reg [5:0] seed;
    reg [5:0] seed_reg;
    reg [5:0] seed_next;
    reg bit;
    
    output reg R;
    reg ready_next;
    
    output reg [5:0] num; 
    
    always @(posedge clk)
        begin
            if (r)
                begin
                    state_reg <= Start;
                    num_reg <= 0;
                    num <= 0;
                    seed_reg <= 0;
                    seed <= 0;
                    R <= 0;
                    num <= 0;
                end
            
            else if (R)
                begin
                    num <= num_reg;
                    seed <= seed_reg;
                end
            
            else
                begin
                    state_reg <= state_next;
                    num_reg <= num_next;
                    seed_reg <= seed_next;
                    R <= ready_next;
                end
        end
    
    always@*
        begin
            
            state_next = state_reg;
            num_next = num_reg;
            seed_next = seed_reg;
            ready_next = R;
            
            case (state_reg)
                Start:
                    begin
                        num_next = 0;
                        seed_next = 0;
                        ready_next = 0;
                        
                        if (In)
                            state_next = Seed;
                    end
                Seed:
                    begin
                        if (In)
                            begin
                                seed_next = seed_reg + 1;
                                num_next = seed_next;
                                state_next = LFSR;
                            end
                        else
                            seed_next = seed_reg + 1;

                    end
                LFSR: 
                    begin  
                        if (In)
                            begin
                                state_next = Ready;
                                num_next = num_reg;
                                ready_next = 1; 
                            end
                        else
                            begin
                                bit = (num_reg ^ (num_reg >> 1)) & 1;
                                num_next = (num_reg >> 1)|(bit << 5);
                            end
                    end
                
                Ready:
                    begin
                        bit = (num_reg ^ (num_reg >> 1)) & 1;
                        num_next = (num_reg >> 1)|(bit << 5);
                    end
                    
                default:  
                    state_next = Start;
            endcase
        end
endmodule