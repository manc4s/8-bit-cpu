`timescale 1ns / 1ps

module d_flipflops_4input (
    input main_clock,
    input data0,
    input data1,
    input data2,
    input data3,
    input load_enable,  // New input to control when to load
    input enable,
    output reg q0,
    output reg q1,
    output reg q2,
    output reg q3,
    
    
    output wire bus0,
    output wire bus1,
    output wire bus2,
    output wire bus3
);
    
    // Internal register to hold bus values
    reg last_data0, last_data1, last_data2, last_data3;
    
    
    always @(posedge main_clock) begin
        if (load_enable) begin
            q0 <= data0;  // Only update Q when load_enable is high
            q1 <= data1;
            q2 <= data2;
            q3 <= data3;
        end
    end
    
    
    
    // Hold last driven value when enable is OFF
    always @(posedge main_clock) begin
        if (enable) begin
            last_data0 <= q0;
            last_data1 <= q1;
            last_data2 <= q2;
            last_data3 <= q3;
        end
    end
    
    
    assign bus0 = last_data0;
    assign bus1 = last_data1;
    assign bus2 = last_data2;
    assign bus3 = last_data3;

    

endmodule