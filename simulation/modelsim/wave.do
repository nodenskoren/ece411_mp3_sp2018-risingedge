onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/forwarding_unit_1/forwarding_unit_out
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/forwarding_unit_2/forwarding_unit_out
add wave -noupdate -expand /mp3_tb/dut/mp3/the_datapath/regfile/data
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/IF_ID_pipeline/stall_pipeline
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/stall_pipeline_load
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/ifetch_rdata
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/program_counter/out
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/flush/state
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/flush/next_state
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/alu/f
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/opcode
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/operation_out_ID_EX
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/operation_out_EX_MEM
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/operation_out_MEM_WB
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/load_regfile_out
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/sr1mux/sel
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/sr1mux/a
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/sr1mux/b
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/sr1mux/c
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/sr1mux/d
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/sr1mux/f
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/sr2_mux/sel
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/sr2_mux/a
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/sr2_mux/b
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/sr2_mux/c
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/sr2_mux/d
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/sr2_mux/f
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {531537 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 267
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
WaveRestoreZoom {312109 ps} {843646 ps}
