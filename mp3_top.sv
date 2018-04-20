import lc3b_types::*;

module mp3_top
(
	wishbone.master wb_mem
);

wishbone ifetch(wb_mem.CLK);
wishbone memory (wb_mem.CLK);
wishbone wb_l2 (wb_mem.CLK);
wishbone wb_evict (wb_mem.CLK);

logic [15:0] dcache_hits, dcache_misses, icache_hits, icache_misses, l2_hits, l2_misses;
logic dcache_hit_clear, dcache_miss_clear, icache_hit_clear, icache_miss_clear, l2_hit_clear, l2_miss_clear;
logic l2_write, l2_read;

mp3 mp3 (
	.ifetch,
	.memory,
	
	.dcache_hits,
	.dcache_misses,
	.icache_hits,
	.icache_misses,
	.l2_hits,
	.l2_misses,
	
	.dcache_hit_clear,
	.dcache_miss_clear,
	.icache_hit_clear,
	.icache_miss_clear,
	.l2_hit_clear,
	.l2_miss_clear
);



wb_interconnect interconnect
(
	.ifetch,
	.memory,
	.wb_l2,
	
	.dcache_hits,
	.dcache_misses,
	.icache_hits,
	.icache_misses,
	.dcache_hit_clear,
	.dcache_miss_clear,
	.icache_hit_clear,
	.icache_miss_clear
);

l2cache l2cache
(
	.wb2(wb_l2),
	//.wb(wb_mem),
	.wb(wb_evict),
	
	.l2_hit_clear,
	.l2_miss_clear,
	.cache_hit_cnt(l2_hits),
	.cache_miss_cnt(l2_misses),
	
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