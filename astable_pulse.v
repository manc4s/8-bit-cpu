`timescale 1ns / 1ps
/*
Astable Pulse Module For Basys 3
Basys 3 operates at 100Mhz, 100 000 000 cycles per second.
For my 8 Bit computer I want 1Hz. 
This function is the clock divider and is called in clock_timer.v
*/

module astable_pulse(
    input wire clk,               // 100 MHz clock input, clk is tied to W5 on the basys 3 for constraints. 
    output reg divided_clk = 0    // output set to zero to start 
    );
     

    //Make the new clock do half a cycle every half of 100Mhz = 50Mhz
    localparam div_value = 50_000_000;  // Correct value for 1 Hz (toggle every 50 million cycles)


    //Create a counter to keep track of cycle
    integer counter_value = 0;  // 32-bit counter

    
    always @(posedge clk) begin
        /*
        On every raised edge meaning every cycle add 1 to the counter, when the counter reaches
        50 million cycles, reset the counter and toggle the outpupt clock to the alternate value.

        All of these use non blocking assignment, waiting for the rising edge to occurs. (<=). This means when the rising edge
        occurs, all assignments can occur in parrallelt vs in sequence. 
        */
        
        if (counter_value >= div_value - 1) begin
            counter_value <= 0;                // Reset counter
            divided_clk <= ~divided_clk;       // Toggle output clock, non blocking assignment using (<=)
        end
        else begin
            counter_value <= counter_value + 1;  // Increment counter
        end
    end
    
   
endmodule