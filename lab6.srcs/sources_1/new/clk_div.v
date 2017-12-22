`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2017 12:33:08 PM
// Design Name: 
// Module Name: clk_div
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


module clk_div(
    input clk,
    
   // input reset,
    output clk_out  
    );




    
    //  reg[1:0] COUNT; 
        
            reg [19:0] COUNT; 
            assign clk_out = COUNT[19];
            
       //    assign clk_out = COUNT[1];  
          
            always @(posedge clk)
            begin
         //   if(reset)
           //     COUNT = 0;
            //else
                COUNT = COUNT + 1; 
            end
         
    endmodule
    
    
