## Generated SDC file "mp1.out.sdc"

## Copyright (C) 1991-2014 Altera Corporation
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, Altera MegaCore Function License 
## Agreement, or other applicable license agreement, including, 
## without limitation, that your use is for the sole purpose of 
## programming logic devices manufactured by Altera and sold by 
## Altera or its authorized distributors.  Please refer to the 
## applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 13.1.4 Build 182 03/12/2014 SJ Full Version"

## DATE    "Wed Apr 18 18:12:10 2018"

##
## DEVICE  "EP3SE50F780C2"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {clk} -period 10.000 -waveform { 0.000 5.000 } [get_ports {wb_mem.CLK}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {clk}] -rise_to [get_clocks {clk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk}] -fall_to [get_clocks {clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk}] -rise_to [get_clocks {clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk}] -fall_to [get_clocks {clk}]  0.020  


#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.ACK}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.CLK}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[0]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[1]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[2]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[3]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[4]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[5]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[6]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[7]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[8]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[9]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[10]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[11]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[12]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[13]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[14]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[15]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[16]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[17]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[18]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[19]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[20]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[21]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[22]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[23]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[24]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[25]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[26]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[27]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[28]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[29]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[30]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[31]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[32]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[33]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[34]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[35]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[36]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[37]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[38]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[39]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[40]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[41]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[42]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[43]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[44]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[45]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[46]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[47]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[48]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[49]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[50]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[51]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[52]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[53]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[54]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[55]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[56]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[57]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[58]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[59]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[60]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[61]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[62]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[63]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[64]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[65]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[66]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[67]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[68]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[69]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[70]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[71]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[72]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[73]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[74]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[75]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[76]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[77]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[78]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[79]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[80]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[81]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[82]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[83]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[84]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[85]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[86]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[87]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[88]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[89]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[90]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[91]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[92]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[93]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[94]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[95]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[96]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[97]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[98]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[99]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[100]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[101]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[102]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[103]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[104]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[105]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[106]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[107]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[108]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[109]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[110]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[111]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[112]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[113]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[114]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[115]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[116]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[117]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[118]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[119]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[120]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[121]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[122]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[123]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[124]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[125]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[126]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_S[127]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.RTY}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.ADR[0]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.ADR[1]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.ADR[2]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.ADR[3]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.ADR[4]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.ADR[5]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.ADR[6]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.ADR[7]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.ADR[8]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.ADR[9]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.ADR[10]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.ADR[11]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.CYC}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[0]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[1]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[2]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[3]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[4]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[5]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[6]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[7]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[8]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[9]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[10]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[11]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[12]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[13]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[14]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[15]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[16]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[17]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[18]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[19]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[20]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[21]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[22]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[23]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[24]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[25]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[26]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[27]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[28]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[29]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[30]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[31]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[32]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[33]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[34]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[35]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[36]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[37]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[38]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[39]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[40]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[41]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[42]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[43]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[44]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[45]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[46]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[47]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[48]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[49]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[50]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[51]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[52]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[53]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[54]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[55]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[56]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[57]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[58]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[59]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[60]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[61]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[62]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[63]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[64]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[65]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[66]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[67]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[68]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[69]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[70]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[71]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[72]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[73]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[74]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[75]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[76]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[77]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[78]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[79]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[80]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[81]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[82]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[83]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[84]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[85]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[86]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[87]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[88]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[89]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[90]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[91]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[92]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[93]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[94]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[95]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[96]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[97]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[98]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[99]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[100]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[101]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[102]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[103]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[104]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[105]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[106]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[107]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[108]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[109]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[110]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[111]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[112]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[113]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[114]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[115]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[116]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[117]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[118]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[119]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[120]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[121]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[122]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[123]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[124]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[125]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[126]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.DAT_M[127]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.SEL[0]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.SEL[1]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.SEL[2]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.SEL[3]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.SEL[4]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.SEL[5]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.SEL[6]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.SEL[7]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.SEL[8]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.SEL[9]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.SEL[10]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.SEL[11]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.SEL[12]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.SEL[13]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.SEL[14]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.SEL[15]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.STB}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {wb_mem.WE}]


#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

