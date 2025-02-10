#Constraints file for clock_timer.v


#clock
#clock on the basys 3 is tied to package pin w5, 100Mhz
#------------------------------------------------------------
set_property PACKAGE_PIN W5 [get_ports {clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk}]


#led timer
#tied to External LED - JC 1 port
#------------------------------------------------------------
#set_property PACKAGE_PIN L1 [get_ports {clock8bit}]					
#set_property IOSTANDARD LVCMOS33 [get_ports {clock8bit}]

set_property PACKAGE_PIN K17 [get_ports {clock8bit}]					
set_property IOSTANDARD LVCMOS33 [get_ports {clock8bit}]
	
	


#led manual_pulse on right most built in led on basys 3.
#tied to led0-(U16)
#------------------------------------------------------------
set_property PACKAGE_PIN U16 [get_ports {manual_pulse_led}]					
set_property IOSTANDARD LVCMOS33 [get_ports {manual_pulse_led}]




#led 1hz pulse
#tied to external LED JC2, or M18 on JC pmod
#------------------------------------------------------------
#set_property PACKAGE_PIN E19 [get_ports {one_hz_led}]					
#set_property IOSTANDARD LVCMOS33 [get_ports {one_hz_led}]
##Sch name = JC2
set_property PACKAGE_PIN M18 [get_ports {one_hz_led}]					
set_property IOSTANDARD LVCMOS33 [get_ports {one_hz_led}]





#switch 0, rightmost switch for select switch between pulses
#------------------------------------------------------------
set_property PACKAGE_PIN V17 [get_ports {select_switch}]					
set_property IOSTANDARD LVCMOS33 [get_ports {select_switch}]


#buttons, for manual pulse - right switch T17
#------------------------------------------------------------
set_property PACKAGE_PIN T17 [get_ports {manual_pulse}]						
set_property IOSTANDARD LVCMOS33 [get_ports {manual_pulse}]



#hlt switch, switch to stop circuit, switch 1
#------------------------------------------------------------
set_property PACKAGE_PIN V16 [get_ports {hlt}]					
set_property IOSTANDARD LVCMOS33 [get_ports {hlt}]




#=====================================================================




# data inputs 4 bits switches 15,14,13,12
set_property PACKAGE_PIN W2 [get_ports {d0}]					
set_property IOSTANDARD LVCMOS33 [get_ports {d0}]
set_property PACKAGE_PIN U1 [get_ports {d1}]					
set_property IOSTANDARD LVCMOS33 [get_ports {d1}]
set_property PACKAGE_PIN T1 [get_ports {d2}]					
set_property IOSTANDARD LVCMOS33 [get_ports {d2}]
set_property PACKAGE_PIN R2 [get_ports {d3}]					
set_property IOSTANDARD LVCMOS33 [get_ports {d3}]

#leds to represent these bus inputs

set_property PACKAGE_PIN P3 [get_ports {bus_led0}]					
set_property IOSTANDARD LVCMOS33 [get_ports {bus_led0}]
set_property PACKAGE_PIN N3 [get_ports {bus_led1}]					
set_property IOSTANDARD LVCMOS33 [get_ports {bus_led1}]
set_property PACKAGE_PIN P1 [get_ports {bus_led2}]					
set_property IOSTANDARD LVCMOS33 [get_ports {bus_led2}]
set_property PACKAGE_PIN L1 [get_ports {bus_led3}]					
set_property IOSTANDARD LVCMOS33 [get_ports {bus_led3}]






#load enable on 11, enable output on 10

set_property PACKAGE_PIN T2 [get_ports {enable}]					
set_property IOSTANDARD LVCMOS33 [get_ports {enable}]
set_property PACKAGE_PIN R3 [get_ports {load_enable}]					
set_property IOSTANDARD LVCMOS33 [get_ports {load_enable}]
set_property PACKAGE_PIN W3 [get_ports {enable_led}]					
set_property IOSTANDARD LVCMOS33 [get_ports {enable_led}]
set_property PACKAGE_PIN U3 [get_ports {load_enable_led}]					
set_property IOSTANDARD LVCMOS33 [get_ports {load_enable_led}]




#q3-q0 outputs leds 9,8,7,6

set_property PACKAGE_PIN U14 [get_ports {q0}]					
set_property IOSTANDARD LVCMOS33 [get_ports {q0}]
set_property PACKAGE_PIN V14 [get_ports {q1}]					
set_property IOSTANDARD LVCMOS33 [get_ports {q1}]
set_property PACKAGE_PIN V13 [get_ports {q2}]					
set_property IOSTANDARD LVCMOS33 [get_ports {q2}]
set_property PACKAGE_PIN V3 [get_ports {q3}]					
set_property IOSTANDARD LVCMOS33 [get_ports {q3}]




#bus duplicates for visualizing the passing back to bus from register.
set_property PACKAGE_PIN U19 [get_ports {bus0}]					
set_property IOSTANDARD LVCMOS33 [get_ports {bus0}]
set_property PACKAGE_PIN V19 [get_ports {bus1}]					
set_property IOSTANDARD LVCMOS33 [get_ports {bus1}]
set_property PACKAGE_PIN W18 [get_ports {bus2}]					
set_property IOSTANDARD LVCMOS33 [get_ports {bus2}]
set_property PACKAGE_PIN U15 [get_ports {bus3}]					
set_property IOSTANDARD LVCMOS33 [get_ports {bus3}]





