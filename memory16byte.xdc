## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

# Clock signal
set_property PACKAGE_PIN W5 [get_ports {clk}]							
set_property IOSTANDARD LVCMOS33 [get_ports {clk}]
	#create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports CLK100MHZ]
 
# Switches
set_property PACKAGE_PIN V17 [get_ports {select_switch}]					
set_property IOSTANDARD LVCMOS33 [get_ports {select_switch}]
set_property PACKAGE_PIN V16 [get_ports {hlt}]					
set_property IOSTANDARD LVCMOS33 [get_ports {hlt}]

#load_enable and enable
set_property PACKAGE_PIN W16 [get_ports {enable}]					
set_property IOSTANDARD LVCMOS33 [get_ports {enable}]
set_property PACKAGE_PIN W17 [get_ports {load_enable}]					
set_property IOSTANDARD LVCMOS33 [get_ports {load_enable}]



#inputs for instructions a0-a3
set_property PACKAGE_PIN W15 [get_ports {a3}]					
set_property IOSTANDARD LVCMOS33 [get_ports {a3}]
set_property PACKAGE_PIN V15 [get_ports {a2}]					
set_property IOSTANDARD LVCMOS33 [get_ports {a2}]
set_property PACKAGE_PIN W14 [get_ports {a1}]					
set_property IOSTANDARD LVCMOS33 [get_ports {a1}]
set_property PACKAGE_PIN W13 [get_ports {a0}]					
set_property IOSTANDARD LVCMOS33 [get_ports {a0}]
	
	
set_property PACKAGE_PIN V2 [get_ports {d0}]					
set_property IOSTANDARD LVCMOS33 [get_ports {d0}]
set_property PACKAGE_PIN T3 [get_ports {d1}]					
set_property IOSTANDARD LVCMOS33 [get_ports {d1}]
set_property PACKAGE_PIN T2 [get_ports {d2}]					
set_property IOSTANDARD LVCMOS33 [get_ports {d2}]
set_property PACKAGE_PIN R3 [get_ports {d3}]					
set_property IOSTANDARD LVCMOS33 [get_ports {d3}]
set_property PACKAGE_PIN W2 [get_ports {d4}]					
set_property IOSTANDARD LVCMOS33 [get_ports {d4}]
set_property PACKAGE_PIN U1 [get_ports {d5}]					
set_property IOSTANDARD LVCMOS33 [get_ports {d5}]
set_property PACKAGE_PIN T1 [get_ports {d6}]					
set_property IOSTANDARD LVCMOS33 [get_ports {d6}]
set_property PACKAGE_PIN R2 [get_ports {d7}]					
set_property IOSTANDARD LVCMOS33 [get_ports {d7}]
 

# LEDs
#set_property PACKAGE_PIN U16 [get_ports {LED[0]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {LED[0]}]
#set_property PACKAGE_PIN E19 [get_ports {LED[1]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {LED[1]}]

#load_enable and enable led's
set_property PACKAGE_PIN U19 [get_ports {enable_led}]					
set_property IOSTANDARD LVCMOS33 [get_ports {enable_led}]
set_property PACKAGE_PIN V19 [get_ports {load_enable_led}]					
set_property IOSTANDARD LVCMOS33 [get_ports {load_enable_led}]

#instructions a0-3 leds'
set_property PACKAGE_PIN W18 [get_ports {input_instruction3}]					
set_property IOSTANDARD LVCMOS33 [get_ports {input_instruction3}]
set_property PACKAGE_PIN U15 [get_ports {input_instruction2}]					
set_property IOSTANDARD LVCMOS33 [get_ports {input_instruction2}]
set_property PACKAGE_PIN U14 [get_ports {input_instruction1}]					
set_property IOSTANDARD LVCMOS33 [get_ports {input_instruction1}]
set_property PACKAGE_PIN V14 [get_ports {input_instruction0}]					
set_property IOSTANDARD LVCMOS33 [get_ports {input_instruction0}]
set_property PACKAGE_PIN V13 [get_ports {input_led0}]					
set_property IOSTANDARD LVCMOS33 [get_ports {input_led0}]
set_property PACKAGE_PIN V3 [get_ports {input_led1}]					
set_property IOSTANDARD LVCMOS33 [get_ports {input_led1}]
set_property PACKAGE_PIN W3 [get_ports {input_led2}]					
set_property IOSTANDARD LVCMOS33 [get_ports {input_led2}]
set_property PACKAGE_PIN U3 [get_ports {input_led3}]					
set_property IOSTANDARD LVCMOS33 [get_ports {input_led3}]
set_property PACKAGE_PIN P3 [get_ports {input_led4}]					
set_property IOSTANDARD LVCMOS33 [get_ports {input_led4}]
set_property PACKAGE_PIN N3 [get_ports {input_led5}]					
set_property IOSTANDARD LVCMOS33 [get_ports {input_led5}]
set_property PACKAGE_PIN P1 [get_ports {input_led6}]					
set_property IOSTANDARD LVCMOS33 [get_ports {input_led6}]
set_property PACKAGE_PIN L1 [get_ports {input_led7}]					
set_property IOSTANDARD LVCMOS33 [get_ports {input_led7}]
	
	
#7 segment display
#set_property PACKAGE_PIN W7 [get_ports {seg[0]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]
#set_property PACKAGE_PIN W6 [get_ports {seg[1]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]
#set_property PACKAGE_PIN U8 [get_ports {seg[2]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]
#set_property PACKAGE_PIN V8 [get_ports {seg[3]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]
#set_property PACKAGE_PIN U5 [get_ports {seg[4]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]
#set_property PACKAGE_PIN V5 [get_ports {seg[5]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]
#set_property PACKAGE_PIN U7 [get_ports {seg[6]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]

#set_property PACKAGE_PIN V7 [get_ports dp]							
	#set_property IOSTANDARD LVCMOS33 [get_ports dp]

#set_property PACKAGE_PIN U2 [get_ports {an[0]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
#set_property PACKAGE_PIN U4 [get_ports {an[1]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
#set_property PACKAGE_PIN V4 [get_ports {an[2]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
#set_property PACKAGE_PIN W4 [get_ports {an[3]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]


##Buttons
#set_property PACKAGE_PIN U18 [get_ports btnC]						
	#set_property IOSTANDARD LVCMOS33 [get_ports btnC]
#set_property PACKAGE_PIN T18 [get_ports btnU]						
	#set_property IOSTANDARD LVCMOS33 [get_ports btnU]
#set_property PACKAGE_PIN W19 [get_ports btnL]						
	#set_property IOSTANDARD LVCMOS33 [get_ports btnL]
set_property PACKAGE_PIN T17 [get_ports manual_pulse]						
set_property IOSTANDARD LVCMOS33 [get_ports manual_pulse]
#set_property PACKAGE_PIN U17 [get_ports btnD]						
	#set_property IOSTANDARD LVCMOS33 [get_ports btnD]
 


##Pmod Header JA
##Sch name = JA1
set_property PACKAGE_PIN J1 [get_ports {bus7}]					
set_property IOSTANDARD LVCMOS33 [get_ports {bus7}]
##Sch name = JA2
set_property PACKAGE_PIN L2 [get_ports {bus6}]					
set_property IOSTANDARD LVCMOS33 [get_ports {bus6}]
##Sch name = JA3
set_property PACKAGE_PIN J2 [get_ports {bus5}]					
set_property IOSTANDARD LVCMOS33 [get_ports {bus5}]
##Sch name = JA4
set_property PACKAGE_PIN G2 [get_ports {bus4}]					
set_property IOSTANDARD LVCMOS33 [get_ports {bus4}]
##Sch name = JA7
set_property PACKAGE_PIN H1 [get_ports {bus3}]					
set_property IOSTANDARD LVCMOS33 [get_ports {bus3}]
##Sch name = JA8
set_property PACKAGE_PIN K2 [get_ports {bus2}]					
set_property IOSTANDARD LVCMOS33 [get_ports {bus2}]
##Sch name = JA9
set_property PACKAGE_PIN H2 [get_ports {bus1}]					
set_property IOSTANDARD LVCMOS33 [get_ports {bus1}]
##Sch name = JA10
set_property PACKAGE_PIN G3 [get_ports {bus0}]					
set_property IOSTANDARD LVCMOS33 [get_ports {bus0}]



##Pmod Header JB
##Sch name = JB1
set_property PACKAGE_PIN A14 [get_ports {manual_pulse_led}]					
set_property IOSTANDARD LVCMOS33 [get_ports {manual_pulse_led}]
##Sch name = JB2
set_property PACKAGE_PIN A16 [get_ports {clock8bit}]					
set_property IOSTANDARD LVCMOS33 [get_ports {clock8bit}]
##Sch name = JB3
set_property PACKAGE_PIN B15 [get_ports {one_hz_led}]					
set_property IOSTANDARD LVCMOS33 [get_ports {one_hz_led}]
##Sch name = JB4
#set_property PACKAGE_PIN B16 [get_ports {JB[3]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[3]}]
##Sch name = JB7
#set_property PACKAGE_PIN A15 [get_ports {JB[4]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[4]}]
##Sch name = JB8
#set_property PACKAGE_PIN A17 [get_ports {JB[5]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[5]}]
##Sch name = JB9
#set_property PACKAGE_PIN C15 [get_ports {JB[6]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[6]}]
##Sch name = JB10 
#set_property PACKAGE_PIN C16 [get_ports {JB[7]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[7]}]
 


##Pmod Header JC
##Sch name = JC1
set_property PACKAGE_PIN K17 [get_ports {q7}]					
set_property IOSTANDARD LVCMOS33 [get_ports {q7}]
##Sch name = JC2
set_property PACKAGE_PIN M18 [get_ports {q6}]					
set_property IOSTANDARD LVCMOS33 [get_ports {q6}]
##Sch name = JC3
set_property PACKAGE_PIN N17 [get_ports {q5}]					
set_property IOSTANDARD LVCMOS33 [get_ports {q5}]
##Sch name = JC4
set_property PACKAGE_PIN P18 [get_ports {q4}]					
set_property IOSTANDARD LVCMOS33 [get_ports {q4}]
##Sch name = JC7
set_property PACKAGE_PIN L17 [get_ports {q3}]					
set_property IOSTANDARD LVCMOS33 [get_ports {q3}]
##Sch name = JC8
set_property PACKAGE_PIN M19 [get_ports {q2}]					
set_property IOSTANDARD LVCMOS33 [get_ports {q2}]
##Sch name = JC9
set_property PACKAGE_PIN P17 [get_ports {q1}]					
set_property IOSTANDARD LVCMOS33 [get_ports {q1}]
##Sch name = JC10
set_property PACKAGE_PIN R18 [get_ports {q0}]					
set_property IOSTANDARD LVCMOS33 [get_ports {q0}]


#Pmod Header JXADC
#Sch name = XA1_P
#set_property PACKAGE_PIN J3 [get_ports {vauxp6}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {vauxp6}]
#Sch name = XA2_P
#set_property PACKAGE_PIN L3 [get_ports {vauxp14}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {vauxp14}]
#Sch name = XA3_P
#set_property PACKAGE_PIN M2 [get_ports {vauxp7}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {vauxp7}]
#Sch name = XA4_P
#set_property PACKAGE_PIN N2 [get_ports {vauxp15}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {vauxp15}]
#Sch name = XA1_N
#set_property PACKAGE_PIN K3 [get_ports {vauxn6}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {vauxn6}]
#Sch name = XA2_N
#set_property PACKAGE_PIN M3 [get_ports {vauxn14}]				
#	set_property IOSTANDARD LVCMOS33 [get_ports {vauxn14}]
#Sch name = XA3_N
#set_property PACKAGE_PIN M1 [get_ports {vauxn7}]				
#	set_property IOSTANDARD LVCMOS33 [get_ports {vauxn7}]
#Sch name = XA4_N
#set_property PACKAGE_PIN N1 [get_ports {vauxn15}]				
#	set_property IOSTANDARD LVCMOS33 [get_ports {vauxn15}]



##VGA Connector
#set_property PACKAGE_PIN G19 [get_ports {vgaRed[0]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {vgaRed[0]}]
#set_property PACKAGE_PIN H19 [get_ports {vgaRed[1]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {vgaRed[1]}]
#set_property PACKAGE_PIN J19 [get_ports {vgaRed[2]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {vgaRed[2]}]
#set_property PACKAGE_PIN N19 [get_ports {vgaRed[3]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {vgaRed[3]}]
#set_property PACKAGE_PIN N18 [get_ports {vgaBlue[0]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {vgaBlue[0]}]
#set_property PACKAGE_PIN L18 [get_ports {vgaBlue[1]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {vgaBlue[1]}]
#set_property PACKAGE_PIN K18 [get_ports {vgaBlue[2]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {vgaBlue[2]}]
#set_property PACKAGE_PIN J18 [get_ports {vgaBlue[3]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {vgaBlue[3]}]
#set_property PACKAGE_PIN J17 [get_ports {vgaGreen[0]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {vgaGreen[0]}]
#set_property PACKAGE_PIN H17 [get_ports {vgaGreen[1]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {vgaGreen[1]}]
#set_property PACKAGE_PIN G17 [get_ports {vgaGreen[2]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {vgaGreen[2]}]
#set_property PACKAGE_PIN D17 [get_ports {vgaGreen[3]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {vgaGreen[3]}]
#set_property PACKAGE_PIN P19 [get_ports Hsync]						
	#set_property IOSTANDARD LVCMOS33 [get_ports Hsync]
#set_property PACKAGE_PIN R19 [get_ports Vsync]						
	#set_property IOSTANDARD LVCMOS33 [get_ports Vsync]


##USB-RS232 Interface
#set_property PACKAGE_PIN B18 [get_ports RsRx]						
	#set_property IOSTANDARD LVCMOS33 [get_ports RsRx]
#set_property PACKAGE_PIN A18 [get_ports RsTx]						
	#set_property IOSTANDARD LVCMOS33 [get_ports RsTx]


##USB HID (PS/2)
#set_property PACKAGE_PIN C17 [get_ports PS2Clk]						
	#set_property IOSTANDARD LVCMOS33 [get_ports PS2Clk]
	#set_property PULLUP true [get_ports PS2Clk]
#set_property PACKAGE_PIN B17 [get_ports PS2Data]					
	#set_property IOSTANDARD LVCMOS33 [get_ports PS2Data]	
	#set_property PULLUP true [get_ports PS2Data]


##Quad SPI Flash
##Note that CCLK_0 cannot be placed in 7 series devices. You can access it using the
##STARTUPE2 primitive.
#set_property PACKAGE_PIN D18 [get_ports {QspiDB[0]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {QspiDB[0]}]
#set_property PACKAGE_PIN D19 [get_ports {QspiDB[1]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {QspiDB[1]}]
#set_property PACKAGE_PIN G18 [get_ports {QspiDB[2]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {QspiDB[2]}]
#set_property PACKAGE_PIN F18 [get_ports {QspiDB[3]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {QspiDB[3]}]
#set_property PACKAGE_PIN K19 [get_ports QspiCSn]					
	#set_property IOSTANDARD LVCMOS33 [get_ports QspiCSn]
