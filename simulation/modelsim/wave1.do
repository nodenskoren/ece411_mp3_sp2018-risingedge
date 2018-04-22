onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand /mp3_tb/dut/mp3/the_datapath/regfile/data
add wave -noupdate /mp3_tb/dut/l2cache/cache_hits/increment_count
add wave -noupdate /mp3_tb/dut/l2cache/cache_controller/state
add wave -noupdate /mp3_tb/dut/l2cache/cache_controller/cache_hit_inc
add wave -noupdate /mp3_tb/dut/l2cache/cache_controller/was_miss
add wave -noupdate /mp3_tb/dut/l2cache/cache_hits/count
add wave -noupdate /mp3_tb/dut/l2cache/cache_controller/cache_miss_inc
add wave -noupdate /mp3_tb/dut/l2cache/cache_misses/increment_count
add wave -noupdate /mp3_tb/dut/l2cache/cache_misses/count
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {310000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 409
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
WaveRestoreZoom {0 ps} {1981312 ps}
