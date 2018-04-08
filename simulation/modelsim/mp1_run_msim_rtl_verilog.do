transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/ldbstblogic.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/lc3b_types.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/cache_control.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/wishbone.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/plus2.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/register.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/mux2.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/badder.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/mux4.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/mux8.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/mux_decode_sel.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/l1arbiter.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/static_branch_prediction.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/array.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/cache_writeword.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/mp3.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/adj.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/alu.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/gencc.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/regfile.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/branch_unit.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/sext5.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/zext.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/IF_ID_pipeline.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/ID_EX_pipeline.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/EX_MEM_pipeline.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/MEM_WB_pipeline.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/control_rom.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/line_to_word.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/set_sel.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/stall_unit.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/forwarding_unit.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/stall_unit_2.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/forwarding_unit_2.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/cache_datapath.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/datapath.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/cache.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/l2cache.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/wb_interconnect.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/mp3_top.sv}

vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/mp3_tb.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/mp3_top.sv}
vlog -sv -work work +incdir+/home/koren3/ece411/RisingEdge/RisingEdge {/home/koren3/ece411/RisingEdge/RisingEdge/physical_memory.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L stratixiii_ver -L rtl_work -L work -voptargs="+acc"  mp3_tb

add wave *
view structure
view signals
run 100 ns
