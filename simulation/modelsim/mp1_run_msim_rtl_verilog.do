transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/counter_rising_edge.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/counter.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/ldbstblogic.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/lc3b_types.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/cache_control.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/wishbone.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/plus2.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/register.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/mux2.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/badder.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/mux4.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/mux8.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/mux_decode_sel.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/l1arbiter.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/mux16.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/counter_decoder.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/always_branch.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/counter_control.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/array.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/cache_writeword.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/mp3.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/adj.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/alu.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/gencc.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/regfile.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/branch_unit.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/sext5.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/zext.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/IF_ID_pipeline.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/ID_EX_pipeline.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/EX_MEM_pipeline.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/MEM_WB_pipeline.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/control_rom.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/line_to_word.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/set_sel.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/stall_unit.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/forwarding_unit.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/stall_unit_2.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/static_branch_prediction.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/forwarding_unit_2.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/forwarding_unit_3.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/cache_datapath.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/datapath.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/cache.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/l2cache.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/wb_interconnect.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/mp3_top.sv}

vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/mp3_tb.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/mp3_top.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/mp3 {/home/koren3/ece411/mp3/physical_memory.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L stratixiii_ver -L rtl_work -L work -voptargs="+acc"  mp3_tb

#add wave *
#view structure
#view signals
run 100 ns
quit -f
