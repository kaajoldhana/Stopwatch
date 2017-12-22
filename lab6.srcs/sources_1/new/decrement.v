`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2017 09:02:18 PM
// Design Name: 
// Module Name: increment
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


module decrement(
    input wire clk,
    input wire reset,
    input wire start_stop,
    output reg  [3:0] t3_r1,
    output reg [3:0] t2_r1,
    output reg [3:0] t1_r1,
    output reg [3:0] t0_r1 
    
    );
    reg[1:0] state; 
    reg[1:0] next_state; 
    
    reg[26:0] firstsec;
    wire[26:0] secondsec; 
   // reg[3:0] t3_r,t2_r,t1_r,t0_r; //digits
    reg[3:0] t3_next, t2_next, t1_next, t0_next; 
    wire t3_on, t2_on, t1_on, t0_on;
    wire s3, s2,s1, s0; 
    

   
        
    
    always @(posedge clk)
        if(reset)
            state <=2'b00; 
         else
            state <= next_state; 

        //00 initial, 01 increment, 10 hold 11 nothing
   always @(*) begin   
   if(reset)
   next_state = 2'b00; 
   if(t3_next == 0 && t2_next == 0 && t1_next == 0 && t0_next == 0)
   next_state = 2'b10;
     
  //  always @ (posedge clk) begin
        case(state)
            2'b00:begin 
                
                if(start_stop)
                    next_state = 2'b01; 
                else
                    next_state = 2'b00; 
            end        
            2'b01:begin
                if(t3_next == 0 && t2_next == 0 && t1_next == 0 && t0_next == 0)
                    next_state = 2'b10;
                else if(reset)
                    next_state = 2'b00; 
                else if (start_stop)
                    next_state = 2'b10; 
                else 
                //if(!reset && !start_stop)
                    next_state = 2'b01; 
            end 
            
            2'b10:begin
                if(reset)
                    next_state = 2'b00;
                else if(start_stop)
                    next_state = 2'b01; 
                        
                else
                    next_state = 2'b10;  
            end
            
            2'b11:begin
                next_state = 2'b00; 
            end
            
            
     endcase
     end
            
            
  
       
  always @(posedge clk)
//  always @(*) // DIDNT WORK 
   begin
      case(state)
        2'b00:begin
            t3_next = 9;
            t2_next = 9;
            t1_next = 9;
            t0_next = 9; 
        end 
        
        2'b01:begin
        if(t0_next == 0 && t1_next == 0 && t2_next == 0 && t3_next == 0) begin
            t0_next = t0_next;
            t1_next = t1_next;
            t2_next = t2_next;
            t3_next = t3_next;
            end
        else begin    
        
        if(t0_next == 0)
        begin
          t0_next = 9; 
          if(t1_next == 0)
          begin
            t1_next =9; 
            if(t2_next == 0)
            begin
                t2_next = 9;
                if(t3_next == 0)
                   t3_next = 9; 
                else
                    t3_next = t3_next - 1;   
                    
            end else
                t2_next = t2_next -1;
            end else
                t1_next = t1_next - 1;
            end else
                t0_next = t0_next - 1; 
           end 
           end
           
         2'b10: begin
         t0_next = t0_next; //save the value
         t1_next = t1_next; //save
         t2_next = t2_next; 
         t3_next = t3_next; 
         end
         
         2'b11: begin
         t3_next = 9;
         t2_next = 9;
         t1_next = 9;
         t0_next = 9; 
         end
         default: begin 
            t3_next = 9;
            t2_next = 9; 
            t1_next = 9;
            t0_next = 9; 
            end 
         endcase
         
                  
         t3_r1 = t3_next;
         t2_r1 = t2_next;
         t1_r1 = t1_next;
         t0_r1 = t0_next; 

         
         end
         
 

         
endmodule          
         
                
          
            
        
        
        
    

