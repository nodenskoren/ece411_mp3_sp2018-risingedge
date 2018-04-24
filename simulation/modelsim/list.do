onerror {resume}
add list -width 51 /mp3_tb/dut/mp3/the_datapath/pht_fail_counter_out
add list /mp3_tb/dut/mp3/the_datapath/prediction_made_counter_out
add list /mp3_tb/dut/mp3/the_datapath/btb_fail_counter_out
add list /mp3_tb/dut/mp3/the_datapath/btb_access_counter_out
configure list -usestrobe 0
configure list -strobestart {0 ps} -strobeperiod {0 ps}
configure list -usesignaltrigger 1
configure list -delta all
configure list -signalnamewidth 0
configure list -datasetprefix 0
configure list -namelimit 5
