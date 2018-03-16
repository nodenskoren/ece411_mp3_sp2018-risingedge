onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mp3_tb/Clk
add wave -noupdate /mp3_tb/dut/the_datapath/opcode
add wave -noupdate /mp3_tb/dut/the_datapath/program_counter/out
add wave -noupdate -expand /mp3_tb/dut/the_datapath/regfile/data
add wave -noupdate /mp3_tb/dut/the_datapath/pcmux/sel
add wave -noupdate /mp3_tb/dut/the_datapath/pcmux/a
add wave -noupdate /mp3_tb/dut/the_datapath/pcmux/b
add wave -noupdate /mp3_tb/dut/the_datapath/pcmux/c
add wave -noupdate /mp3_tb/dut/the_datapath/pcmux/d
add wave -noupdate /mp3_tb/dut/the_datapath/jump_enable
add wave -noupdate /mp3_tb/dut/the_datapath/jsr_enable
add wave -noupdate /mp3_tb/dut/the_datapath/branch_enable
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {173013 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {82352 ps} {213602 ps}
