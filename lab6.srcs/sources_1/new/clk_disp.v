`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2017 01:49:39 PM
// Design Name: 
// Module Name: clk_disp
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

module clk_disp(
    input clk,
   // input reset,
    output out_disp  
    );




    
    //  reg[1:0] COUNT; 
        
            reg [16:0] COUNT; 
            assign out_disp = COUNT[16];
            
       //    assign clk_out = COUNT[1];  
          
            always @(posedge clk)
            begin
   //         if(reset)
     //          COUNT = 0;
      //      else
                COUNT = COUNT + 1; 
            end
         
    endmodule
    
    
