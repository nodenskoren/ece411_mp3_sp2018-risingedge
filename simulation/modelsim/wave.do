onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mp3_tb/Clk
add wave -noupdate /mp3_tb/Clk
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/pht_fail_counter_out
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/prediction_made_counter_out
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/btb_fail_counter_out
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/btb_access_counter_out
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/btb_access_counter/increment_count
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/always_branch/pc
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/always_branch/branch_prediction_address
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/always_branch/btb_access
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/always_branch/pc_EX_MEM
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/always_branch/btb_update
add wave -noupdate -label Branch_prediction_EX_MEM /mp3_tb/dut/mp3/the_datapath/flush/branch_prediction
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/flush/branch_prediction_address
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/flush/br_address
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/always_branch/branch_prediction
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/pc
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/always_branch/instruction
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/pc_out_ID_EX
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/always_branch/branch_history_out
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/EX_MEM_pipeline/branch_history_out
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/operation_out_ID_EX
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/pc_out_EX_MEM
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/operation_out_EX_MEM
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/pc_out_MEM_WB
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/flush/btb_fail
add wave -noupdate -radix decimal /mp3_tb/dut/mp3/the_datapath/always_branch/curr
add wave -noupdate -radix decimal /mp3_tb/dut/mp3/the_datapath/always_branch/prev
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/flush/state
add wave -noupdate /mp3_tb/dut/mp3/the_datapath/flush/next_state
add wave -noupdate {/mp3_tb/dut/mp3/the_datapath/always_branch/pht[81]}
add wave -noupdate {/mp3_tb/dut/mp3/the_datapath/always_branch/pht[80]}
add wave -noupdate {/mp3_tb/dut/mp3/the_datapath/always_branch/pht[79]}
add wave -noupdate {/mp3_tb/dut/mp3/the_datapath/always_branch/pht[78]}
add wave -noupdate {/mp3_tb/dut/mp3/the_datapath/always_branch/pht[77]}
add wave -noupdate {/mp3_tb/dut/mp3/the_datapath/always_branch/pht[76]}
add wave -noupdate {/mp3_tb/dut/mp3/the_datapath/always_branch/pht[75]}
add wave -noupdate {/mp3_tb/dut/mp3/the_datapath/always_branch/pht[74]}
add wave -noupdate {/mp3_tb/dut/mp3/the_datapath/always_branch/pht[73]}
add wave -noupdate {/mp3_tb/dut/mp3/the_datapath/always_branch/pht[72]}
add wave -noupdate {/mp3_tb/dut/mp3/the_datapath/always_branch/pht[71]}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {59837088 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 273
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
WaveRestoreZoom {59825243 ps} {60004550 ps}
