onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mp3_tb/Clk
add wave -noupdate -expand /mp3_tb/dut/mp3/the_datapath/regfile/data
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/stall_unit/state
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/stall_unit/next_state
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/stall_unit/mem_address_buffer
add wave -noupdate -label pcout /mp3_tb/dut/mp3/the_datapath/program_counter/out
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/flush/state
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/flush/next_state
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/alu_out_out_EX_MEM
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/regfilemux_out_MEM_WB
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/stall_unit/mem_read_in
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/stall_unit/mem_write_in
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/stall_unit/mem_resp
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/stall_unit/ifetch_resp
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/mem_address
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/mem_wdata
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/mem_rdata
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/stall_pipeline
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/stall_pipeline_load
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/jump_enable
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/jsr_enable
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/trap_enable
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/EX_MEM_pipeline/dest_data_out
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/addr_adder_out_out_EX_MEM
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/opcode
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/operation_out_ID_EX
add wave -noupdate -radix binary /mp3_tb/dut/mp3/the_datapath/instruction_out_ID_EX
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/operation_out_EX_MEM
add wave -noupdate -radix binary /mp3_tb/dut/mp3/the_datapath/instruction_out_EX_MEM
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/operation_out_MEM_WB
add wave -noupdate -radix binary /mp3_tb/dut/mp3/the_datapath/instruction_out_MEM_WB
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/load_regfile_out
add wave -noupdate -radix binary /mp3_tb/dut/mp3/the_datapath/instruction
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/forwarding_unit_1/register_num
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/forwarding_unit_1/regwrite_EX
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/forwarding_unit_1/regwrite_MEM
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/forwarding_unit_1/destreg_EX
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/forwarding_unit_1/destreg_MEM
add wave -noupdate -label Forwarding_unit_1_sel /mp3_tb/dut/mp3/the_datapath/sr1mux/sel
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/sr1mux/a
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/sr1mux/b
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/sr1mux/c
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/sr1mux/d
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/sr1mux/f
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/forwarding_unit_2/regwrite_EX
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/forwarding_unit_2/regwrite_MEM
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/forwarding_unit_2/register_num
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/forwarding_unit_2/destreg_EX
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/forwarding_unit_2/destreg_MEM
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/forwarding_unit_2/operation
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/forwarding_unit_2/imm_mode
add wave -noupdate -label Forwarding_unit_2_sel /mp3_tb/dut/mp3/the_datapath/sr2_mux/sel
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/sr2_mux/a
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/sr2_mux/b
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/sr2_mux/c
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/sr2_mux/d
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/sr2_mux/f
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/alu/f
add wave -noupdate -label alumux_sel /mp3_tb/dut/mp3/the_datapath/alumux/sel
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/alumux/a
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/alumux/b
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/alumux/c
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/alumux/d
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/alumux/f
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {153973162 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 256
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
WaveRestoreZoom {153956995 ps} {154008291 ps}
