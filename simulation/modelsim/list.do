onerror {resume}
add list -notrig -width 42 /mp3_tb/dut/mp3/the_datapath/mem_address
add list -notrig -width 49 /mp3_tb/dut/mp3/the_datapath/alu_out_out_EX_MEM
add list /mp3_tb/dut/mp3/the_datapath/mem_write
add list -notrig -width 40 /mp3_tb/dut/mp3/the_datapath/mem_wdata
configure list -usestrobe 0
configure list -strobestart {0 ps} -strobeperiod {0 ps}
configure list -usesignaltrigger 1
configure list -delta all
configure list -signalnamewidth 0
configure list -datasetprefix 0
configure list -namelimit 5
