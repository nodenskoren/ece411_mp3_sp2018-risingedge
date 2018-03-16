onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mp3_tb/Clk
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/opcode
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/program_counter/out
add wave -noupdate -expand /mp3_tb/dut/mp3/the_datapath/regfile/data
add wave -noupdate -expand /mp3_tb/dut/interconnect/Icache/cache_datapath/data0/data
add wave -noupdate -expand /mp3_tb/dut/interconnect/Icache/cache_datapath/data1/data
add wave -noupdate /mp3_tb/dut/interconnect/arbiter/cache_sel
add wave -noupdate /mp3_tb/dut/interconnect/arbiter/state
add wave -noupdate /mp3_tb/dut/interconnect/arbiter/mem_resp
add wave -noupdate /mp3_tb/dut/interconnect/arbiter/d_rw
add wave -noupdate /mp3_tb/dut/interconnect/arbiter/i_rw
add wave -noupdate -expand /mp3_tb/dut/interconnect/Dcache/cache_datapath/data0/data
add wave -noupdate -expand /mp3_tb/dut/interconnect/Dcache/cache_datapath/data1/data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {893890 ps} 0}
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
WaveRestoreZoom {0 ps} {2100 ns}
