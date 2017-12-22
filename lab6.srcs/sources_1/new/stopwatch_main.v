

module stopwatch_main(
    input clk, 
    input reset,
    input start_stop, 
    input  [9:0] sw, 
    output [3:0] an,
    output [7:0] sseg
    
);
    wire slow_clk; 
    reg[3:0] mode_val;  
    reg [3:0] t3_in, t2_in, t1_in, t0_in;
    wire [3:0] t3_in1, t2_in1, t1_in1, t0_in1; 
    wire [3:0] t3_in2, t2_in2, t1_in2, t0_in2;
    wire [3:0] t3_in3, t2_in3, t1_in3, t0_in3;
    wire [3:0] t3_in4, t2_in4, t1_in4, t0_in4;
   
    clk_div c1 (clk, slow_clk);
    clk_disp c2 (clk, out_disp);  
    
   // always@(posedge clk) begin 
    //if(sw[1:0] == 2'b00) begin //mode 1
        increment m1 (
                    .clk(slow_clk),
                    .reset(reset),
                    .start_stop(start_stop),
                    .t3_r(t3_in1), .t2_r(t2_in1), .t1_r(t1_in1), .t0_r(t0_in1)
                    );
        decrement m3 (
                    .clk(slow_clk),
                    .reset(reset),
                    .start_stop(start_stop),
                    .t3_r1(t3_in2), .t2_r1(t2_in2), .t1_r1(t1_in2), .t0_r1(t0_in2)
                    );
                    
        increment_val1 m2 (
                    .clk(slow_clk),
                    .reset(reset),
                    .start_stop(start_stop), 
                    .sw_in(sw[9:2]),
                    .t3_r(t3_in3), .t2_r(t2_in3), .t1_r(t1_in3), .t0_r(t0_in3)

        
                        );       
        decrement_val m4 (
                    .clk(slow_clk),
                     .reset(reset),
                     .start_stop(start_stop), 
                     .sw_in(sw[9:2]),
                     .t3_r(t3_in4), .t2_r(t2_in4), .t1_r(t1_in4), .t0_r(t0_in4)
        
       
                           );                         
always @(*) begin    
if(sw[1:0] == 2'b00)
    mode_val = 1;    
else if(sw[1:0] == 2'b01)
    mode_val = 2;
else if(sw[1:0] == 2'b10)
    mode_val = 3;
else if(sw[1:0] == 2'b11)
   mode_val = 4;                 
end 

always@(*)begin
    case(mode_val)
    1: begin 
        t3_in = t3_in1; 
        t2_in = t2_in1;
        t1_in = t1_in1;
        t0_in = t0_in1;
        end
    2:begin
        t3_in = t3_in2;
        t2_in = t2_in2; 
        t1_in = t1_in2;
        t0_in = t0_in2;
        end
    3:begin
        t3_in = t3_in3;
        t2_in = t2_in3; 
        t1_in = t1_in3;
        t0_in = t0_in3;
        end
     4:begin
        t3_in = t3_in4;
        t2_in = t2_in4; 
        t1_in = t1_in4;
        t0_in = t0_in4;
        end        
    default: begin
        t3_in = 0;
        t2_in = 0;
        t1_in = 0;
        t0_in = 0; 
        end
             
    endcase      
 end           
    
                                      
                    
       stopwatch_mux  k1(
           .clk(out_disp), 
           .reset(reset),
           .d_t3(t3_in), .d_t2(t2_in), .d_t1(t1_in), .d_t0(t0_in),
           .decimal_in(4'b1011),
           .an(an), 
           .sseg(sseg)         
       );             
                                     
   // end
   // end
  //  if(sw[1:0] == 2'b01) begin //mode 2
    
   // end
    //if(sw[1:0] == 2'b10) begin // mode3
    
  //  end
  //  if(sw[1:0] == 2'b11) begin //mode 4
    
   // end 
    
endmodule 