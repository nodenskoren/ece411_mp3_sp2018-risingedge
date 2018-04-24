onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mp3_tb/Clk
add wave -noupdate -expand /mp3_tb/dut/mp3/the_datapath/regfile/data
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/stall_unit/state
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/stall_unit/next_state
add wave -noupdate -label pcout /mp3_tb/dut/mp3/the_datapath/program_counter/out
add wave -noupdate -radix binary /mp3_tb/dut/mp3/the_datapath/ifetch_word_out
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/opcode
add wave -noupdate -radix binary /mp3_tb/dut/mp3/the_datapath/instruction
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/operation_out_ID_EX
add wave -noupdate -radix binary /mp3_tb/dut/mp3/the_datapath/instruction_out_ID_EX
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/operation_out_EX_MEM
add wave -noupdate -radix binary /mp3_tb/dut/mp3/the_datapath/instruction_out_EX_MEM
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/operation_out_MEM_WB
add wave -noupdate -radix binary /mp3_tb/dut/mp3/the_datapath/instruction_out_MEM_WB
add wave -noupdate -radix binary /mp3_tb/dut/mp3/the_datapath/cc_out
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/always_branch/branch_prediction
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/flush/state
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/flush/next_state
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/load_regfile_out
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/prediction_fail
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/regfilemux/sel
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/pc_plus2_out_EX_MEM
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/alu_out_out_EX_MEM
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/addr_adder_out_out_EX_MEM
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/regfilemux_out_MEM_WB
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/stall_pipeline
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/stall_pipeline_load
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/jump_enable
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/jsr_enable
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/trap_enable
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/branch_enable_out
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/flush/btb_fail
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/flush/branch_prediction
add wave -noupdate -radix binary /mp3_tb/dut/mp3/the_datapath/instruction
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/forwarding_unit_1/register_num
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/forwarding_unit_1/regwrite_EX
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/forwarding_unit_1/regwrite_MEM
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/forwarding_unit_1/destreg_EX
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/forwarding_unit_1/destreg_MEM
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {18474011 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 333
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
WaveRestoreZoom {18442785 ps} {18503012 ps}
