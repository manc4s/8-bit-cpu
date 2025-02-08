`timescale 1ns / 1ps


module four_bit_reg(
    input clk, //100Mhz
    input wire select_switch, //select switch
    input wire manual_pulse,  // button input
    input wire hlt, // stop switch
    output wire clock8bit, //represents final output of clock circuit


    //Output LED's for visualizing pulse
    output wire manual_pulse_led,  //manual
    output wire one_hz_led,  //astable
    
    
    
    //------------------------------------------------------------------
    //inout because its the bus. 
    input d0,
    input d1,
    input  d2,
    input  d3,   //represent 4 input in bus, controlled by switches incase i want to tweak the value being stored.
    
    output wire bus_led0,
    output wire bus_led1,
    output wire bus_led2,
    output wire bus_led3,     //represent 4 bit led from bus?
    
    
    
    input load_enable,
    output wire load_enable_led,
    
    
    input enable,
    output wire enable_led,
    
    
    output wire q0,
    output wire q1,
    output wire q2,
    output wire q3,
    
    
   
    output wire bus0,
    output wire bus1,
    output wire bus2,
    output wire bus3
    
    );
    
    
    assign load_enable_led = load_enable;
    assign bus_led0 = d0;
    assign bus_led1 = d1;
    assign bus_led2 = d2;
    assign bus_led3 = d3;
    
 
    
    
        
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

    
    
    d_flipflops_4input dff0(
        .main_clock(main_clock),
        .data0(d0),
        .data1(d1),
        .data2(d2),
        .data3(d3),
        .load_enable(load_enable),  // New input to control when to load
        .enable(enable),
        .q0(q0),
        .q1(q1),
        .q2(q2),
        .q3(q3),
        .bus0(bus0),
        .bus1(bus1),
        .bus2(bus2),
        .bus3(bus3)
    );

    
   
    
    
    
    
    
    
    
    
    
    
endmodule
