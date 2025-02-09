`timescale 1ns / 1ps



//1 Hz clock
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



//clock, adding switch between astable and manual pulse,
//outputs showing the constant pulse, and the manual pulse seperate from the main clock pulse.
//hlt sitch included
//manual button input too

/*
Main Clock Timer circuit for 8 Bit CPU Project


image of circuit:
https://github.com/manc4s/Clock_Timer/blob/main/Clock%20Timer%20Circuit.png

inputs:
astable_pulse, select_switch, manual pulse, hlt switch
outputs:
led0 to show manual pulse, led1 to show astable pulse, led15 to show Clock timer output. 
*/

module clock_timer(
    input clk, //100Mhz
    input wire select_switch, //select switch
    input wire manual_pulse,  // button input
    input wire hlt, // stop switch
    output wire clock8bit, //represents final output of clock circuit


    //Output LED's for visualizing pulse
    output wire manual_pulse_led,  //manual
    output wire one_hz_led  //astable
    );


    
    wire onehzclock; //represents divided clock
    wire[2:0] output_lines; //used for wires in the circuit(3 channel bus name output_lines)


    //tie led's for visualizing directly to their respective signals
    assign manual_pulse_led = manual_pulse;
    assign one_hz_led = onehzclock;


    //call the astable_pulse module from
    //astable_pulse.v 
    //should be located in the design sources folder alongside this .v file.
        //clk input as clk and divided_clk output as onehzclock
    astable_pulse ap (
        .clk(clk), 
        .divided_clk(onehzclock)
        );
    
    
    //at this point we should have
    //inputs:
            //ap - outut is onehzclock
            //select_switch
            //manual_pulse
            //hlt
            
    //outputs:
            //output_lines[0]
            //output_lines[1]
            //output_lines[2]
            //clock8bit
    
    

    //The Circuit
    assign output_lines[0] = onehzclock & select_switch;
    assign output_lines[1] = (~select_switch)& manual_pulse;
    assign output_lines[2] = ~hlt;
    //Combination_line to output the Or of the first two output lines so it can then go into an and gate with output_lines[2] without causing a combinational loop for reassigning to the same output line twice. 
    //So to be safe another wire is introduced. 
    wire combination_line = (output_lines[0]| output_lines[1]);


    //final 8 bit clock for cpu clock signal depending on the state of the inputs. 
    assign clock8bit = combination_line & output_lines[2];
    
    
endmodule

`timescale 1ns / 1ps


module memory16byte (
    input clk, //100Mhz
    input wire select_switch, //select switch
    input wire manual_pulse,  // button input
    input wire hlt, // stop switch
    output wire clock8bit, //represents final output of clock circuit


    //Output LED's for visualizing pulse
    output wire manual_pulse_led,  //manual
    output wire one_hz_led,  //astable
    
    
    
    //------------------------------------------------------------------
    
    
    //8 bit data input 
    input d0,
    input d1,
    input d2,
    input d3,   //represent 4 input in bus, controlled by switches incase i want to tweak the value being stored.
    input d4,
    input d5,
    input d6,
    input d7,
    
   
    
    
    
    //represent 8 bit number on leds being input by user?
    output wire input_led0,
    output wire input_led1,
    output wire input_led2,
    output wire input_led3,
    output wire input_led4,
    output wire input_led5,
    output wire input_led6,
    output wire input_led7,
    
    
    input load_enable,
    output wire load_enable_led,
    
    
    input enable,
    output wire enable_led,
    
    
    output reg q0,
    output reg q1,
    output reg q2,
    output reg q3,
    output reg q4,
    output reg q5,
    output reg q6,
    output reg q7,
    
    
    
    
   
    output reg bus0,
    output reg bus1,
    output reg bus2,
    output reg bus3,
    output reg bus4,
    output reg bus5,
    output reg bus6,
    output reg bus7
    
    );
    
    
    assign load_enable_led = load_enable;
    assign input_led0 = d0;
    assign input_led1 = d1;
    assign input_led2 = d2;
    assign input_led3 = d3;
    assign input_led4 = d4;
    assign input_led5 = d5;
    assign input_led6 = d6;
    assign input_led7 = d7;
    
 
    
    
        
    wire main_clock;
    
    
    clock_timer mc_1(
        .clk(clk), //100Mhz
        .select_switch(select_switch), //select switch
        .manual_pulse(manual_pulse),  // button input
        .hlt(hlt), // stop switch
        .clock8bit(main_clock), //represents final output of clock circuit


        //Output LED's for visualizing pulse
        .manual_pulse_led(manual_pulse_led),  //manual
        .one_hz_led(one_hz_led)  //astable
    );
    
    
    assign clock8bit = main_clock;
   
   
   //led to show enable on or off
    assign enable_led = enable;

    
    
    
    
    //hold values in register 8 bit when loaded
    always @(posedge main_clock) begin
        if (load_enable) begin
            q0 <= d0;  // Only update Q when load_enable is high
            q1 <= d1;
            q2 <= d2;
            q3 <= d3;
            q4 <= d4;
            q5 <= d5;
            q6 <= d6;
            q7 <= d7;
        end
    end
    
    
    
    // Hold values in bus when enabled
    always @(posedge main_clock) begin
        if (enable) begin
            bus0 <= q0;
            bus1 <= q1;
            bus2 <= q2;
            bus3 <= q3;
            bus4 <= q4;
            bus5 <= q5;
            bus6 <= q6;
            bus7 <= q7;
        end
    end
    
    
endmodule


