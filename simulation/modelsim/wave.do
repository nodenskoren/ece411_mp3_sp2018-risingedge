onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mp3_tb/Clk
add wave -noupdate -expand /mp3_tb/dut/the_datapath/regfile/data
add wave -noupdate /mp3_tb/dut/the_datapath/program_counter/out
add wave -noupdate /mp3_tb/dut/the_datapath/pcmux/a
add wave -noupdate /mp3_tb/dut/the_datapath/pcmux/b
add wave -noupdate /mp3_tb/dut/the_datapath/pcmux/f
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {284415 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {187891 ps} {443891 ps}
