onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/opcode
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/program_counter/out
add wave -noupdate -expand /mp3_tb/dut/mp3/the_datapath/regfile/data
add wave -noupdate /mp3_tb/dut/interconnect/arbiter/cache_sel
add wave -noupdate -expand /mp3_tb/dut/interconnect/Dcache/cache_datapath/data0/data
add wave -noupdate -expand /mp3_tb/dut/interconnect/Dcache/cache_datapath/data1/data
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/memory_rdata_ldi_sti/data
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/regfilemux/sel
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/regfilemux/a
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/regfilemux/b
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/regfilemux/c
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/regfilemux/d
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/regfilemux/e
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/regfilemux/f
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/regfilemux/g
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/regfilemux/h
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/regfilemux/out
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/set_sel/out
add wave -noupdate /mp3_tb/dut/memory/CLK
add wave -noupdate /mp3_tb/dut/memory/DAT_M
add wave -noupdate /mp3_tb/dut/memory/DAT_S
add wave -noupdate /mp3_tb/dut/memory/ACK
add wave -noupdate /mp3_tb/dut/memory/CYC
add wave -noupdate /mp3_tb/dut/memory/STB
add wave -noupdate /mp3_tb/dut/memory/RTY
add wave -noupdate /mp3_tb/dut/memory/WE
add wave -noupdate /mp3_tb/dut/memory/ADR
add wave -noupdate /mp3_tb/dut/memory/SEL
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {39422992 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 263
configure wave -valuecolwidth 364
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
WaveRestoreZoom {39036993 ps} {39683889 ps}
