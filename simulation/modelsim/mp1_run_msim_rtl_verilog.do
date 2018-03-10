transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/jtlew2/ece411/risingedge {/home/jtlew2/ece411/risingedge/wishbone.sv}
vlog -sv -work work +incdir+/home/jtlew2/ece411/risingedge {/home/jtlew2/ece411/risingedge/lc3b_types.sv}
vlog -sv -work work +incdir+/home/jtlew2/ece411/risingedge {/home/jtlew2/ece411/risingedge/plus2.sv}
vlog -sv -work work +incdir+/home/jtlew2/ece411/risingedge {/home/jtlew2/ece411/risingedge/register.sv}
vlog -sv -work work +incdir+/home/jtlew2/ece411/risingedge {/home/jtlew2/ece411/risingedge/mux2.sv}
vlog -sv -work work +incdir+/home/jtlew2/ece411/risingedge {/home/jtlew2/ece411/risingedge/badder.sv}
vlog -sv -work work +incdir+/home/jtlew2/ece411/risingedge {/home/jtlew2/ece411/risingedge/mux4.sv}
vlog -sv -work work +incdir+/home/jtlew2/ece411/risingedge {/home/jtlew2/ece411/risingedge/mp3.sv}
vlog -sv -work work +incdir+/home/jtlew2/ece411/risingedge {/home/jtlew2/ece411/risingedge/adj.sv}
vlog -sv -work work +incdir+/home/jtlew2/ece411/risingedge {/home/jtlew2/ece411/risingedge/alu.sv}
vlog -sv -work work +incdir+/home/jtlew2/ece411/risingedge {/home/jtlew2/ece411/risingedge/gencc.sv}
vlog -sv -work work +incdir+/home/jtlew2/ece411/risingedge {/home/jtlew2/ece411/risingedge/regfile.sv}
vlog -sv -work work +incdir+/home/jtlew2/ece411/risingedge {/home/jtlew2/ece411/risingedge/branch_unit.sv}
vlog -sv -work work +incdir+/home/jtlew2/ece411/risingedge {/home/jtlew2/ece411/risingedge/sext5.sv}
vlog -sv -work work +incdir+/home/jtlew2/ece411/risingedge {/home/jtlew2/ece411/risingedge/IF_ID_pipeline.sv}
vlog -sv -work work +incdir+/home/jtlew2/ece411/risingedge {/home/jtlew2/ece411/risingedge/ID_EX_pipeline.sv}
vlog -sv -work work +incdir+/home/jtlew2/ece411/risingedge {/home/jtlew2/ece411/risingedge/EX_MEM_pipeline.sv}
vlog -sv -work work +incdir+/home/jtlew2/ece411/risingedge {/home/jtlew2/ece411/risingedge/MEM_WB_pipeline.sv}
vlog -sv -work work +incdir+/home/jtlew2/ece411/risingedge {/home/jtlew2/ece411/risingedge/control_rom.sv}
vlog -sv -work work +incdir+/home/jtlew2/ece411/risingedge {/home/jtlew2/ece411/risingedge/line_to_word.sv}
vlog -sv -work work +incdir+/home/jtlew2/ece411/risingedge {/home/jtlew2/ece411/risingedge/set_sel.sv}
vlog -sv -work work +incdir+/home/jtlew2/ece411/risingedge {/home/jtlew2/ece411/risingedge/datapath.sv}

vlog -sv -work work +incdir+/home/jtlew2/ece411/risingedge {/home/jtlew2/ece411/risingedge/magic_memory_dual_port.sv}
vlog -sv -work work +incdir+/home/jtlew2/ece411/risingedge {/home/jtlew2/ece411/risingedge/mp3_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L stratixiii_ver -L rtl_work -L work -voptargs="+acc"  mp3_tb.sv

add wave *
view structure
view signals
run 100 ns
