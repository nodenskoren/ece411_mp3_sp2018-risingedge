import lc3b_types::*;

module mp3_top
(
	wishbone.master wb_mem
);

wishbone ifetch(wb_mem.CLK);
wishbone memory (wb_mem.CLK);
wishbone wb_l2 (wb_mem.CLK);

mp3 mp3 (
	.ifetch,
	.memory
);



wb_interconnect interconnect
(
	.ifetch,
	.memory,
	.wb_l2
);

l2cache l2cache
(
	.wb2(wb_l2),
	.wb(wb_mem)
	
);

endmodule : mp3_top