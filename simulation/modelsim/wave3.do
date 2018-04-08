onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -height 15 /mp3_tb/Clk
add wave -noupdate -height 15 /mp3_tb/Clk
add wave -noupdate -height 15 /mp3_tb/Clk
add wave -noupdate -height 15 /mp3_tb/Clk
add wave -noupdate -height 15 /mp3_tb/dut/interconnect/arbiter/state
add wave -noupdate -height 15 /mp3_tb/dut/interconnect/arbiter/i_rw
add wave -noupdate -height 15 /mp3_tb/dut/interconnect/arbiter/d_rw
add wave -noupdate -height 15 /mp3_tb/Clk
add wave -noupdate -height 15 /mp3_tb/dut/mp3/the_datapath/program_counter/data
add wave -noupdate -height 15 -expand -subitemconfig {{/mp3_tb/dut/mp3/the_datapath/regfile/data[7]} {-height 15} {/mp3_tb/dut/mp3/the_datapath/regfile/data[6]} {-height 15} {/mp3_tb/dut/mp3/the_datapath/regfile/data[5]} {-height 15} {/mp3_tb/dut/mp3/the_datapath/regfile/data[4]} {-height 15} {/mp3_tb/dut/mp3/the_datapath/regfile/data[3]} {-height 15} {/mp3_tb/dut/mp3/the_datapath/regfile/data[2]} {-height 15} {/mp3_tb/dut/mp3/the_datapath/regfile/data[1]} {-height 15} {/mp3_tb/dut/mp3/the_datapath/regfile/data[0]} {-height 15}} /mp3_tb/dut/mp3/the_datapath/regfile/data
add wave -noupdate -height 15 /mp3_tb/dut/mp3/the_datapath/IF_ID_pipeline/instruction_out
add wave -noupdate -height 15 -expand -subitemconfig {{/mp3_tb/dut/interconnect/Dcache/cache_datapath/data0/data[7]} {-height 15} {/mp3_tb/dut/interconnect/Dcache/cache_datapath/data0/data[6]} {-height 15} {/mp3_tb/dut/interconnect/Dcache/cache_datapath/data0/data[5]} {-height 15} {/mp3_tb/dut/interconnect/Dcache/cache_datapath/data0/data[4]} {-height 15} {/mp3_tb/dut/interconnect/Dcache/cache_datapath/data0/data[3]} {-height 15} {/mp3_tb/dut/interconnect/Dcache/cache_datapath/data0/data[2]} {-height 15} {/mp3_tb/dut/interconnect/Dcache/cache_datapath/data0/data[1]} {-height 15} {/mp3_tb/dut/interconnect/Dcache/cache_datapath/data0/data[0]} {-height 15}} /mp3_tb/dut/interconnect/Dcache/cache_datapath/data0/data
add wave -noupdate -height 15 -expand -subitemconfig {{/mp3_tb/dut/interconnect/Dcache/cache_datapath/data1/data[7]} {-height 15} {/mp3_tb/dut/interconnect/Dcache/cache_datapath/data1/data[6]} {-height 15} {/mp3_tb/dut/interconnect/Dcache/cache_datapath/data1/data[5]} {-height 15} {/mp3_tb/dut/interconnect/Dcache/cache_datapath/data1/data[4]} {-height 15} {/mp3_tb/dut/interconnect/Dcache/cache_datapath/data1/data[3]} {-height 15} {/mp3_tb/dut/interconnect/Dcache/cache_datapath/data1/data[2]} {-height 15} {/mp3_tb/dut/interconnect/Dcache/cache_datapath/data1/data[1]} {-height 15} {/mp3_tb/dut/interconnect/Dcache/cache_datapath/data1/data[0]} {-height 15}} /mp3_tb/dut/interconnect/Dcache/cache_datapath/data1/data
add wave -noupdate -height 15 /mp3_tb/dut/memory/CLK
add wave -noupdate -height 15 /mp3_tb/dut/memory/DAT_M
add wave -noupdate -height 15 /mp3_tb/dut/memory/DAT_S
add wave -noupdate -height 15 /mp3_tb/dut/memory/ACK
add wave -noupdate -height 15 /mp3_tb/dut/memory/CYC
add wave -noupdate -height 15 /mp3_tb/dut/memory/STB
add wave -noupdate -height 15 /mp3_tb/dut/memory/RTY
add wave -noupdate -height 15 /mp3_tb/dut/memory/WE
add wave -noupdate -height 15 /mp3_tb/dut/memory/ADR
add wave -noupdate -height 15 /mp3_tb/dut/memory/SEL
add wave -noupdate -height 15 /mp3_tb/dut/mp3/the_datapath/regfilemux_out_MEM_WB
add wave -noupdate -height 15 /mp3_tb/dut/mp3/the_datapath/ID_EX_pipeline/ctrl_out
add wave -noupdate -height 15 -subitemconfig {/mp3_tb/dut/mp3/the_datapath/EX_MEM_pipeline/ctrl_out.opcode {-height 15} /mp3_tb/dut/mp3/the_datapath/EX_MEM_pipeline/ctrl_out.load_cc {-height 15} /mp3_tb/dut/mp3/the_datapath/EX_MEM_pipeline/ctrl_out.is_br {-height 15} /mp3_tb/dut/mp3/the_datapath/EX_MEM_pipeline/ctrl_out.is_j {-height 15} /mp3_tb/dut/mp3/the_datapath/EX_MEM_pipeline/ctrl_out.is_trap {-height 15} /mp3_tb/dut/mp3/the_datapath/EX_MEM_pipeline/ctrl_out.aluop {-height 15} /mp3_tb/dut/mp3/the_datapath/EX_MEM_pipeline/ctrl_out.regfilemux_sel {-height 15} /mp3_tb/dut/mp3/the_datapath/EX_MEM_pipeline/ctrl_out.alumux_sel {-height 15} /mp3_tb/dut/mp3/the_datapath/EX_MEM_pipeline/ctrl_out.load_regfile {-height 15} /mp3_tb/dut/mp3/the_datapath/EX_MEM_pipeline/ctrl_out.mem_read {-height 15} /mp3_tb/dut/mp3/the_datapath/EX_MEM_pipeline/ctrl_out.mem_write {-height 15} /mp3_tb/dut/mp3/the_datapath/EX_MEM_pipeline/ctrl_out.is_jsr {-height 15} /mp3_tb/dut/mp3/the_datapath/EX_MEM_pipeline/ctrl_out.addr_sel {-height 15} /mp3_tb/dut/mp3/the_datapath/EX_MEM_pipeline/ctrl_out.mem_byte_enable {-height 15} /mp3_tb/dut/mp3/the_datapath/EX_MEM_pipeline/ctrl_out.is_ldi {-height 15} /mp3_tb/dut/mp3/the_datapath/EX_MEM_pipeline/ctrl_out.is_sti {-height 15}} /mp3_tb/dut/mp3/the_datapath/EX_MEM_pipeline/ctrl_out
add wave -noupdate -height 15 /mp3_tb/dut/mp3/the_datapath/stall_unit/stall_pipeline
add wave -noupdate -height 15 /mp3_tb/dut/mp3/the_datapath/stall_unit/state
add wave -noupdate -height 15 /mp3_tb/dut/mp3/the_datapath/forwarding_unit_1/regwrite_EX
add wave -noupdate -height 15 /mp3_tb/dut/mp3/the_datapath/forwarding_unit_1/regwrite_MEM
add wave -noupdate -height 15 /mp3_tb/dut/mp3/the_datapath/forwarding_unit_1/register_num
add wave -noupdate -height 15 /mp3_tb/dut/mp3/the_datapath/forwarding_unit_1/operation
add wave -noupdate -height 15 /mp3_tb/dut/mp3/the_datapath/forwarding_unit_1/destreg_EX
add wave -noupdate -height 15 /mp3_tb/dut/mp3/the_datapath/forwarding_unit_1/destreg_MEM
add wave -noupdate -height 15 /mp3_tb/dut/mp3/the_datapath/forwarding_unit_1/forwarding_unit_out
add wave -noupdate -height 15 /mp3_tb/dut/mp3/the_datapath/forwarding_unit_2/regwrite_EX
add wave -noupdate -height 15 /mp3_tb/dut/mp3/the_datapath/forwarding_unit_2/regwrite_MEM
add wave -noupdate -height 15 /mp3_tb/dut/mp3/the_datapath/forwarding_unit_2/register_num
add wave -noupdate -height 15 /mp3_tb/dut/mp3/the_datapath/forwarding_unit_2/destreg_EX
add wave -noupdate -height 15 /mp3_tb/dut/mp3/the_datapath/forwarding_unit_2/destreg_MEM
add wave -noupdate -height 15 /mp3_tb/dut/mp3/the_datapath/forwarding_unit_2/operation
add wave -noupdate -height 15 /mp3_tb/dut/mp3/the_datapath/forwarding_unit_2/imm_mode
add wave -noupdate -height 15 /mp3_tb/dut/mp3/the_datapath/forwarding_unit_2/forwarding_unit_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {55730000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 446
configure wave -valuecolwidth 213
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
WaveRestoreZoom {55705639 ps} {55909940 ps}
