onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mp1_tb/clk
add wave -noupdate /mp1_tb/mem_resp
add wave -noupdate /mp1_tb/mem_read
add wave -noupdate /mp1_tb/mem_write
add wave -noupdate /mp1_tb/mem_byte_enable
add wave -noupdate /mp1_tb/mem_address
add wave -noupdate /mp1_tb/mem_rdata
add wave -noupdate /mp1_tb/mem_wdata
add wave -noupdate /mp1_tb/dut/the_datapath/the_regfile/clk
add wave -noupdate /mp1_tb/dut/the_datapath/the_regfile/load
add wave -noupdate /mp1_tb/dut/the_datapath/the_regfile/in
add wave -noupdate /mp1_tb/dut/the_datapath/the_regfile/src_a
add wave -noupdate /mp1_tb/dut/the_datapath/the_regfile/src_b
add wave -noupdate /mp1_tb/dut/the_datapath/the_regfile/dest
add wave -noupdate /mp1_tb/dut/the_datapath/the_regfile/reg_a
add wave -noupdate /mp1_tb/dut/the_datapath/the_regfile/reg_b
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {19998774 ps} 0}
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
WaveRestoreZoom {19998434 ps} {20000083 ps}
