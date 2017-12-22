`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2017 01:25:34 PM
// Design Name: 
// Module Name: stopwatch_mux
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module stopwatch_mux(
    input clk,
    input reset,
    
    input wire [3:0] d_t3, d_t2, d_t1, d_t0,
    input wire [3:0] decimal_in,
    output reg [3:0] an,
    output reg [7:0] sseg
    );
    reg dp;
    reg[1:0] state;
    reg[1:0] next_state; 
    reg[3:0] num_out;
    
    
    always @(posedge clk) begin

   // if(reset)
     //   state <= 2'b00;
    //else
    state<=next_state; 
    end 
         
    always @(*) begin
        case(state)
            2'b00: next_state = 2'b01;
            2'b01: next_state = 2'b10;
            2'b10: next_state = 2'b11;
            2'b11: next_state = 2'b00; 
        endcase
      end
      
      always @(*) begin  
        case(state)
            2'b00: begin
                an = 4'b1110;
                num_out = d_t0;
                dp = decimal_in[0]; 
            end
            2'b01: begin
                an= 4'b1101;
                num_out = d_t1;
                dp = decimal_in[1]; 
            end
            2'b10: begin
                an = 4'b1011;
                num_out = d_t2;
                dp = decimal_in[2]; 
            end
            2'b11: begin
                an = 4'b0111;
                num_out = d_t3; 
                dp = decimal_in[3]; 
            end
           // default:
             //   begin
             //   an = 4'b1111;
             //   dp = 1'b1;
              //  end  
                
       endcase
     end
     
 always @(*) begin
        case(num_out)
            4'b0000: sseg[6:0] = 7'b0000001;
            4'b0001: sseg[6:0] = 7'b1001111;
            4'b0010: sseg[6:0] = 7'b0010010;
            4'b0011: sseg[6:0] = 7'b0000110; 
            4'b0100: sseg[6:0] = 7'b1001100;
            4'b0101: sseg[6:0] = 7'b0100100;
            4'b0110: sseg[6:0] = 7'b0100000;
            4'b0111: sseg[6:0] = 7'b0001111; 
            4'b1000: sseg[6:0] = 7'b0000000; 
            4'b1001: sseg[6:0] = 7'b0001100;
            4'b1010: sseg[6:0] = 7'b0001000;
            4'b1011: sseg[6:0] = 7'b1100000;
            4'b1100: sseg[6:0] = 7'b0110001;
            4'b1101: sseg[6:0] = 7'b1000010;
            4'b1110: sseg[6:0] = 7'b0110000;
            4'b1111: sseg[6:0] = 7'b0111000;
            default: sseg[6:0] = 7'b0000001; //default is zero   
         endcase  
        sseg[7] = dp;         
      end
      
      
            
endmodule
