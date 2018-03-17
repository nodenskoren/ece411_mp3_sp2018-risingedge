onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mp3_tb/dut/the_datapath/MEM_WB_pipeline/regfilemux_out
add wave -noupdate /mp3_tb/dut/the_datapath/MEM_WB_pipeline/load_regfile
add wave -noupdate /mp3_tb/dut/the_datapath/MEM_WB_pipeline/dest
add wave -noupdate -label PC /mp3_tb/dut/the_datapath/program_counter/data
add wave -noupdate /mp3_tb/dut/the_datapath/IF_ID_pipeline/instruction
add wave -noupdate -expand /mp3_tb/dut/the_datapath/regfile/data
add wave -noupdate /mp3_tb/dut/the_datapath/opcode
add wave -noupdate /mp3_tb/dut/the_datapath/stall_pipeline
add wave -noupdate /mp3_tb/dut/the_datapath/stall_unit/is_ldi
add wave -noupdate /mp3_tb/dut/the_datapath/stall_unit/is_sti
add wave -noupdate /mp3_tb/dut/the_datapath/regfilemux/sel
add wave -noupdate /mp3_tb/dut/the_datapath/regfilemux/a
add wave -noupdate /mp3_tb/dut/the_datapath/regfilemux/b
add wave -noupdate /mp3_tb/dut/the_datapath/regfilemux/c
add wave -noupdate /mp3_tb/dut/the_datapath/regfilemux/d
add wave -noupdate /mp3_tb/dut/the_datapath/regfilemux/e
add wave -noupdate /mp3_tb/dut/the_datapath/regfilemux/f
add wave -noupdate /mp3_tb/dut/the_datapath/regfilemux/g
add wave -noupdate /mp3_tb/dut/the_datapath/regfilemux/h
add wave -noupdate /mp3_tb/dut/the_datapath/regfilemux/out
add wave -noupdate /mp3_tb/dut/the_datapath/mem_address
add wave -noupdate /mp3_tb/dut/the_datapath/mem_address_mux_out
add wave -noupdate /mp3_tb/dut/the_datapath/memory_word_out
add wave -noupdate /mp3_tb/dut/the_datapath/mem_read_EX_MEM
add wave -noupdate /mp3_tb/dut/the_datapath/mem_read
add wave -noupdate /mp3_tb/dut/the_datapath/mem_write_EX_MEM
add wave -noupdate /mp3_tb/dut/the_datapath/mem_write
add wave -noupdate /mp3_tb/dut/the_datapath/set_sel/mem_wdata_word
add wave -noupdate /mp3_tb/dut/the_datapath/set_sel/mem_byte_enable
add wave -noupdate /mp3_tb/dut/the_datapath/stall_unit/state
add wave -noupdate {/mp3_tb/memory_cp1/mem[3]}
add wave -noupdate {/mp3_tb/memory_cp1/mem[5]}
add wave -noupdate /mp3_tb/dut/the_datapath/set_sel/offset
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {12852763 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 456
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
WaveRestoreZoom {12798048 ps} {12905366 ps}
