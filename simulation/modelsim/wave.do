onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mp3_tb/Clk
add wave -noupdate /mp3_tb/Clk
add wave -noupdate /mp3_tb/Clk
add wave -noupdate -expand /mp3_tb/dut/mp3/the_datapath/regfile/data
add wave -noupdate /mp3_tb/dut/wb_evict/CLK
add wave -noupdate /mp3_tb/dut/wb_evict/DAT_M
add wave -noupdate /mp3_tb/dut/wb_evict/DAT_S
add wave -noupdate /mp3_tb/dut/wb_evict/ACK
add wave -noupdate /mp3_tb/dut/wb_evict/CYC
add wave -noupdate /mp3_tb/dut/wb_evict/STB
add wave -noupdate /mp3_tb/dut/wb_evict/RTY
add wave -noupdate /mp3_tb/dut/wb_evict/WE
add wave -noupdate /mp3_tb/dut/wb_evict/ADR
add wave -noupdate /mp3_tb/dut/wb_evict/SEL
add wave -noupdate /mp3_tb/dut/l2cache4way/adr_buffer/clk
add wave -noupdate /mp3_tb/dut/l2cache4way/adr_buffer/load
add wave -noupdate /mp3_tb/dut/l2cache4way/adr_buffer/in
add wave -noupdate /mp3_tb/dut/l2cache4way/adr_buffer/out
add wave -noupdate /mp3_tb/dut/l2cache4way/adr_buffer/data
add wave -noupdate /mp3_tb/dut/l2cache4way/cache_controller4way/state
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
add wave -noupdate -expand /mp3_tb/dut/interconnect/Dcache/cache_datapath/data0/data
add wave -noupdate -expand /mp3_tb/dut/l2cache4way/cache_datapath4way/data0/data
add wave -noupdate /mp3_tb/dut/wb_evict/CLK
add wave -noupdate /mp3_tb/dut/wb_evict/DAT_M
add wave -noupdate /mp3_tb/dut/wb_evict/DAT_S
add wave -noupdate /mp3_tb/dut/wb_evict/ACK
add wave -noupdate /mp3_tb/dut/wb_evict/CYC
add wave -noupdate /mp3_tb/dut/wb_evict/STB
add wave -noupdate /mp3_tb/dut/wb_evict/RTY
add wave -noupdate /mp3_tb/dut/wb_evict/WE
add wave -noupdate /mp3_tb/dut/wb_evict/ADR
add wave -noupdate /mp3_tb/dut/wb_evict/SEL
add wave -noupdate /mp3_tb/dut/wb_l2/CLK
add wave -noupdate /mp3_tb/dut/wb_l2/DAT_M
add wave -noupdate /mp3_tb/dut/wb_l2/DAT_S
add wave -noupdate /mp3_tb/dut/wb_l2/ACK
add wave -noupdate /mp3_tb/dut/wb_l2/CYC
add wave -noupdate /mp3_tb/dut/wb_l2/STB
add wave -noupdate /mp3_tb/dut/wb_l2/RTY
add wave -noupdate /mp3_tb/dut/wb_l2/WE
add wave -noupdate /mp3_tb/dut/wb_l2/ADR
add wave -noupdate /mp3_tb/dut/wb_l2/SEL
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2303011 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 409
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
WaveRestoreZoom {18809225 ps} {19799881 ps}
