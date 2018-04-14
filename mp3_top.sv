import lc3b_types::*;

module mp3_top
(
	wishbone.master wb_mem
);

wishbone ifetch(wb_mem.CLK);
wishbone memory (wb_mem.CLK);
wishbone wb_l2 (wb_mem.CLK);
wishbone wb_evict (wb_mem.CLK);
logic l2_write, l2_read;

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
	.wb(wb_evict),
	.pmem_write(l2_write),
	.pmem_read(l2_read)
);

evict_buffer evict_buffer
(
	.wb_l2(wb_evict),
	.wb_mem,
	.mem_write(l2_write),
	.mem_read(l2_read)
);

endmodule : mp3_top