onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -height 15 /mp3_tb/dut/interconnect/arbiter/state
add wave -noupdate -height 15 /mp3_tb/dut/interconnect/arbiter/i_rw
add wave -noupdate -height 15 /mp3_tb/dut/interconnect/arbiter/d_rw
add wave -noupdate -height 15 /mp3_tb/Clk
add wave -noupdate -height 15 /mp3_tb/dut/ifetch/CLK
add wave -noupdate -height 15 /mp3_tb/dut/ifetch/DAT_M
add wave -noupdate -height 15 /mp3_tb/dut/ifetch/DAT_S
add wave -noupdate -height 15 /mp3_tb/dut/ifetch/ACK
add wave -noupdate -height 15 /mp3_tb/dut/ifetch/CYC
add wave -noupdate -height 15 /mp3_tb/dut/ifetch/STB
add wave -noupdate -height 15 /mp3_tb/dut/ifetch/RTY
add wave -noupdate -height 15 /mp3_tb/dut/ifetch/WE
add wave -noupdate -height 15 /mp3_tb/dut/ifetch/ADR
add wave -noupdate -height 15 /mp3_tb/dut/ifetch/SEL
add wave -noupdate -height 15 /mp3_tb/wb_mem/CLK
add wave -noupdate -height 15 /mp3_tb/wb_mem/DAT_M
add wave -noupdate -height 15 /mp3_tb/wb_mem/DAT_S
add wave -noupdate -height 15 /mp3_tb/wb_mem/ACK
add wave -noupdate -height 15 /mp3_tb/wb_mem/CYC
add wave -noupdate -height 15 /mp3_tb/wb_mem/STB
add wave -noupdate -height 15 /mp3_tb/wb_mem/RTY
add wave -noupdate -height 15 /mp3_tb/wb_mem/WE
add wave -noupdate -height 15 /mp3_tb/wb_mem/ADR
add wave -noupdate -height 15 /mp3_tb/wb_mem/SEL
add wave -noupdate -height 15 /mp3_tb/dut/mp3/the_datapath/program_counter/data
add wave -noupdate -height 15 -expand -subitemconfig {{/mp3_tb/dut/mp3/the_datapath/regfile/data[7]} {-height 15} {/mp3_tb/dut/mp3/the_datapath/regfile/data[6]} {-height 15} {/mp3_tb/dut/mp3/the_datapath/regfile/data[5]} {-height 15} {/mp3_tb/dut/mp3/the_datapath/regfile/data[4]} {-height 15} {/mp3_tb/dut/mp3/the_datapath/regfile/data[3]} {-height 15} {/mp3_tb/dut/mp3/the_datapath/regfile/data[2]} {-height 15} {/mp3_tb/dut/mp3/the_datapath/regfile/data[1]} {-height 15} {/mp3_tb/dut/mp3/the_datapath/regfile/data[0]} {-height 15}} /mp3_tb/dut/mp3/the_datapath/regfile/data
add wave -noupdate -height 15 /mp3_tb/dut/mp3/the_datapath/IF_ID_pipeline/instruction_out
add wave -noupdate -height 15 /mp3_tb/dut/memory/CLK
add wave -noupdate -height 15 /mp3_tb/dut/memory/DAT_M
add wave -noupdate -height 15 /mp3_tb/dut/memory/DAT_S
add wave -noupdate -height 15 /mp3_tb/dut/memory/ACK
add wave -noupdate -height 15 /mp3_tb/dut/memory/CYC
add wave -noupdate -height 15 /mp3_tb/dut/memory/STB
add wave -noupdate -height 15 /mp3_tb/dut/memory/RTY
add wave -noupdate -height 15 /mp3_tb/dut/memory/WE
add wave -noupdate -height 15 /mp3_tb/dut/memory/ADR
add wave -noupdate -height 15 /mp3_tb/dut/memory/SEL
add wave -noupdate -height 15 /mp3_tb/dut/mp3/the_datapath/ID_EX_pipeline/ctrl_out
add wave -noupdate -height 15 /mp3_tb/dut/mp3/the_datapath/EX_MEM_pipeline/ctrl_out
add wave -noupdate -height 15 /mp3_tb/dut/mp3/the_datapath/stall_unit/stall_pipeline
add wave -noupdate -height 15 /mp3_tb/dut/mp3/the_datapath/stall_unit/state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {781163 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 412
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {592592 ps} {852240 ps}
