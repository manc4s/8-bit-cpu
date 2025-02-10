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
    
   
    //memory location inputs   
    input a0,
    input a1,
    input a2,
    input a3,
    //leds to represent them on the board
    output wire input_instruction0,
    output wire input_instruction1,
    output wire input_instruction2,
    output wire input_instruction3,
    
    
    
    
    
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
    
    
    //wires because they will output to LED's but the registers outputs will be reg bus's of size 1byte
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
    
    
    assign input_instruction0 = a0;
    assign input_instruction1 = a1;
    assign input_instruction2 = a2;
    assign input_instruction3 = a3;
 
    
    
        
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

    
    //16 bytes of memory 
    reg [7:0] q_register0;
    reg [7:0] q_register1;
    reg [7:0] q_register2;
    reg [7:0] q_register3;
    reg [7:0] q_register4;
    reg [7:0] q_register5;
    reg [7:0] q_register6;
    reg [7:0] q_register7;
    reg [7:0] q_register8;
    reg [7:0] q_register9;
    reg [7:0] q_register10;
    reg [7:0] q_register11;
    reg [7:0] q_register12;
    reg [7:0] q_register13;
    reg [7:0] q_register14;
    reg [7:0] q_register15;
   
    
    //hold 16 byte memory
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
        
        
        if (load_enable&a0&a1&a2&a3) begin
            q_register0[0] <= d0;  // Only update Q when load_enable is high
            q_register0[1] <= d1;
            q_register0[2] <= d2;
            q_register0[3] <= d3;
            q_register0[4] <= d4;
            q_register0[5] <= d5;
            q_register0[6] <= d6;
            q_register0[7] <= d7;
        end else if (load_enable&a0&a1&a2&(~a3)) begin
            q_register1[0] <= d0;  // Only update Q when load_enable is high
            q_register1[1] <= d1;
            q_register1[2] <= d2;
            q_register1[3] <= d3;
            q_register1[4] <= d4;
            q_register1[5] <= d5;
            q_register1[6] <= d6;
            q_register1[7] <= d7;
        end else if (load_enable&a0&a1&(~a2)&(a3)) begin
            q_register2[0] <= d0;  // Only update Q when load_enable is high
            q_register2[1] <= d1;
            q_register2[2] <= d2;
            q_register2[3] <= d3;
            q_register2[4] <= d4;
            q_register2[5] <= d5;
            q_register2[6] <= d6;
            q_register2[7] <= d7;
        end else if (load_enable&a0&(~a1)&a2&(a3)) begin
            q_register3[0] <= d0;  // Only update Q when load_enable is high
            q_register3[1] <= d1;
            q_register3[2] <= d2;
            q_register3[3] <= d3;
            q_register3[4] <= d4;
            q_register3[5] <= d5;
            q_register3[6] <= d6;
            q_register3[7] <= d7;
        end else if (load_enable&(~a0)&a1&a2&(a3)) begin
            q_register4[0] <= d0;  // Only update Q when load_enable is high
            q_register4[1] <= d1;
            q_register4[2] <= d2;
            q_register4[3] <= d3;
            q_register4[4] <= d4;
            q_register4[5] <= d5;
            q_register4[6] <= d6;
            q_register4[7] <= d7;
        end else if (load_enable&a0&a1&(~a2)&(~a3)) begin
            q_register5[0] <= d0;  // Only update Q when load_enable is high
            q_register5[1] <= d1;
            q_register5[2] <= d2;
            q_register5[3] <= d3;
            q_register5[4] <= d4;
            q_register5[5] <= d5;
            q_register5[6] <= d6;
            q_register5[7] <= d7;
        end else if (load_enable&a0&(~a1)&(~a2)&(a3)) begin
            q_register6[0] <= d0;  // Only update Q when load_enable is high
            q_register6[1] <= d1;
            q_register6[2] <= d2;
            q_register6[3] <= d3;
            q_register6[4] <= d4;
            q_register6[5] <= d5;
            q_register6[6] <= d6;
            q_register6[7] <= d7;
        end else if (load_enable&(~a0)&(~a1)&a2&(a3)) begin
            q_register7[0] <= d0;  // Only update Q when load_enable is high
            q_register7[1] <= d1;
            q_register7[2] <= d2;
            q_register7[3] <= d3;
            q_register7[4] <= d4;
            q_register7[5] <= d5;
            q_register7[6] <= d6;
            q_register7[7] <= d7;
        end else if (load_enable&(~a0)&a1&a2&(~a3)) begin
            q_register8[0] <= d0;  // Only update Q when load_enable is high
            q_register8[1] <= d1;
            q_register8[2] <= d2;
            q_register8[3] <= d3;
            q_register8[4] <= d4;
            q_register8[5] <= d5;
            q_register8[6] <= d6;
            q_register8[7] <= d7;
        end else if (load_enable&a0&(~a1)&(~a2)&(~a3)) begin
            q_register9[0] <= d0;  // Only update Q when load_enable is high
            q_register9[1] <= d1;
            q_register9[2] <= d2;
            q_register9[3] <= d3;
            q_register9[4] <= d4;
            q_register9[5] <= d5;
            q_register9[6] <= d6;
            q_register9[7] <= d7;
        end else if (load_enable&(~a0)&(~a1)&(~a2)&(a3)) begin
            q_register10[0] <= d0;  // Only update Q when load_enable is high
            q_register10[1] <= d1;
            q_register10[2] <= d2;
            q_register10[3] <= d3;
            q_register10[4] <= d4;
            q_register10[5] <= d5;
            q_register10[6] <= d6;
            q_register10[7] <= d7;
        end else if (load_enable&(~a0)&(~a1)&a2&(~a3)) begin
            q_register11[0] <= d0;  // Only update Q when load_enable is high
            q_register11[1] <= d1;
            q_register11[2] <= d2;
            q_register11[3] <= d3;
            q_register11[4] <= d4;
            q_register11[5] <= d5;
            q_register11[6] <= d6;
            q_register11[7] <= d7;
        end else if (load_enable&(~a0)&(~a1)&(~a2)&(~a3)) begin
            q_register12[0] <= d0;  // Only update Q when load_enable is high
            q_register12[1] <= d1;
            q_register12[2] <= d2;
            q_register12[3] <= d3;
            q_register12[4] <= d4;
            q_register12[5] <= d5;
            q_register12[6] <= d6;
            q_register12[7] <= d7;
        end else if (load_enable&a0&(~a1)&a2&(~a3)) begin
            q_register13[0] <= d0;  // Only update Q when load_enable is high
            q_register13[1] <= d1;
            q_register13[2] <= d2;
            q_register13[3] <= d3;
            q_register13[4] <= d4;
            q_register13[5] <= d5;
            q_register13[6] <= d6;
            q_register13[7] <= d7;
        end else if (load_enable&(~a0)&a1&(~a2)&(a3)) begin
            q_register14[0] <= d0;  // Only update Q when load_enable is high
            q_register14[1] <= d1;
            q_register14[2] <= d2;
            q_register14[3] <= d3;
            q_register14[4] <= d4;
            q_register14[5] <= d5;
            q_register14[6] <= d6;
            q_register14[7] <= d7;
        end else if (load_enable&(~a0)&a1&(~a2)&(~a3)) begin
            q_register15[0] <= d0;  // Only update Q when load_enable is high
            q_register15[1] <= d1;
            q_register15[2] <= d2;
            q_register15[3] <= d3;
            q_register15[4] <= d4;
            q_register15[5] <= d5;
            q_register15[6] <= d6;
            q_register15[7] <= d7;
        end
        
    end
    
    
    
    // Hold values in bus when enabled
    always @(posedge main_clock) begin 
        
        if (enable&a0&a1&a2&a3) begin
            bus0 <= q_register0[0];  // Only update bus when enable is high
            bus1 <= q_register0[1];
            bus2 <= q_register0[2];
            bus3 <= q_register0[3];
            bus4 <= q_register0[4];
            bus5 <= q_register0[5];
            bus6 <= q_register0[6];
            bus7 <= q_register0[7];
        end else if (enable&a0&a1&a2&(~a3)) begin
            bus0 <= q_register1[0];  // Only update bus when enable is high
            bus1 <= q_register1[1];
            bus2 <= q_register1[2];
            bus3 <= q_register1[3];
            bus4 <= q_register1[4];
            bus5 <= q_register1[5];
            bus6 <= q_register1[6];
            bus7 <= q_register1[7];
        end else if (enable&a0&a1&(~a2)&(a3)) begin
            bus0 <= q_register2[0];  // Only update bus when enable is high
            bus1 <= q_register2[1];
            bus2 <= q_register2[2];
            bus3 <= q_register2[3];
            bus4 <= q_register2[4];
            bus5 <= q_register2[5];
            bus6 <= q_register2[6];
            bus7 <= q_register2[7];
        end else if (enable&a0&(~a1)&a2&(a3)) begin
            bus0 <= q_register3[0];  // Only update bus when enable is high
            bus1 <= q_register3[1];
            bus2 <= q_register3[2];
            bus3 <= q_register3[3];
            bus4 <= q_register3[4];
            bus5 <= q_register3[5];
            bus6 <= q_register3[6];
            bus7 <= q_register3[7];
        end else if (enable&(~a0)&a1&a2&(a3)) begin
            bus0 <= q_register4[0];  // Only update bus when enable is high
            bus1 <= q_register4[1];
            bus2 <= q_register4[2];
            bus3 <= q_register4[3];
            bus4 <= q_register4[4];
            bus5 <= q_register4[5];
            bus6 <= q_register4[6];
            bus7 <= q_register4[7];
        end else if (enable&a0&a1&(~a2)&(~a3)) begin
            bus0 <= q_register5[0];  // Only update bus when enable is high
            bus1 <= q_register5[1];
            bus2 <= q_register5[2];
            bus3 <= q_register5[3];
            bus4 <= q_register5[4];
            bus5 <= q_register5[5];
            bus6 <= q_register5[6];
            bus7 <= q_register5[7];
        end else if (enable&a0&(~a1)&(~a2)&(a3)) begin
            bus0 <= q_register6[0];  // Only update bus when enable is high
            bus1 <= q_register6[1];
            bus2 <= q_register6[2];
            bus3 <= q_register6[3];
            bus4 <= q_register6[4];
            bus5 <= q_register6[5];
            bus6 <= q_register6[6];
            bus7 <= q_register6[7];;
        end else if (enable&(~a0)&(~a1)&a2&(a3)) begin
            bus0 <= q_register7[0];  // Only update bus when enable is high
            bus1 <= q_register7[1];
            bus2 <= q_register7[2];
            bus3 <= q_register7[3];
            bus4 <= q_register7[4];
            bus5 <= q_register7[5];
            bus6 <= q_register7[6];
            bus7 <= q_register7[7];
        end else if (enable&(~a0)&a1&a2&(~a3)) begin
            bus0 <= q_register8[0];  // Only update bus when enable is high
            bus1 <= q_register8[1];
            bus2 <= q_register8[2];
            bus3 <= q_register8[3];
            bus4 <= q_register8[4];
            bus5 <= q_register8[5];
            bus6 <= q_register8[6];
            bus7 <= q_register8[7];
        end else if (enable&a0&(~a1)&(~a2)&(~a3)) begin
            bus0 <= q_register9[0];  // Only update bus when enable is high
            bus1 <= q_register9[1];
            bus2 <= q_register9[2];
            bus3 <= q_register9[3];
            bus4 <= q_register9[4];
            bus5 <= q_register9[5];
            bus6 <= q_register9[6];
            bus7 <= q_register9[7];
        end else if (enable&(~a0)&(~a1)&(~a2)&(a3)) begin
            bus0 <= q_register10[0];  // Only update bus when enable is high
            bus1 <= q_register10[1];
            bus2 <= q_register10[2];
            bus3 <= q_register10[3];
            bus4 <= q_register10[4];
            bus5 <= q_register10[5];
            bus6 <= q_register10[6];
            bus7 <= q_register10[7];
        end else if (enable&(~a0)&(~a1)&a2&(~a3)) begin
            bus0 <= q_register11[0];  // Only update bus when enable is high
            bus1 <= q_register11[1];
            bus2 <= q_register11[2];
            bus3 <= q_register11[3];
            bus4 <= q_register11[4];
            bus5 <= q_register11[5];
            bus6 <= q_register11[6];
            bus7 <= q_register11[7];
        end else if (enable&(~a0)&(~a1)&(~a2)&(~a3)) begin
            bus0 <= q_register12[0];  // Only update bus when enable is high
            bus1 <= q_register12[1];
            bus2 <= q_register12[2];
            bus3 <= q_register12[3];
            bus4 <= q_register12[4];
            bus5 <= q_register12[5];
            bus6 <= q_register12[6];
            bus7 <= q_register12[7];
        end else if (enable&a0&(~a1)&a2&(~a3)) begin
            bus0 <= q_register13[0];  // Only update bus when enable is high
            bus1 <= q_register13[1];
            bus2 <= q_register13[2];
            bus3 <= q_register13[3];
            bus4 <= q_register13[4];
            bus5 <= q_register13[5];
            bus6 <= q_register13[6];
            bus7 <= q_register13[7];
        end else if (enable&(~a0)&a1&(~a2)&(a3)) begin
            bus0 <= q_register14[0];  // Only update bus when enable is high
            bus1 <= q_register14[1];
            bus2 <= q_register14[2];
            bus3 <= q_register14[3];
            bus4 <= q_register14[4];
            bus5 <= q_register14[5];
            bus6 <= q_register14[6];
            bus7 <= q_register14[7];
        end else if (enable&(~a0)&a1&(~a2)&(~a3)) begin
            bus0 <= q_register15[0];  // Only update bus when enable is high
            bus1 <= q_register15[1];
            bus2 <= q_register15[2];
            bus3 <= q_register15[3];
            bus4 <= q_register15[4];
            bus5 <= q_register15[5];
            bus6 <= q_register15[6];
            bus7 <= q_register15[7];       
        end
        
        
        
    end

endmodule


