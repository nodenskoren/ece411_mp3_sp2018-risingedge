MP4 Progress Report Checkpoint 4
This checkpoint, we implemented software performance counters, the eviction write buffer, and static branch predition. We additionally fixed all of the remaining bugs from running the final and competition code. Alex designed the eviction write buffer, Josh designed the software counters, and Nodens finished the static branch prediction. Everyone participated in debugging, and Alex handled merging the completed code.

Roadmap for CP5:
For the final checkpoint, we will add a 4-way cache, dynamic branch prediction, and hardware prefetching. Josh will focus on the hardware prefetching, Alex will handle handle the 4-way cache, and Nodens will handle the dynamic branch predition. Additionally, we will examine performance and clock speeds in more detail to see other tweaks to improve performance for the competition.

We plan to implement the GShare predictor, as it gives the highest accuracy on the benchmark tests. We would be tracking the branch history in an 8-bit branch history register, and XOR it with the lowest 8 bits of the PC, then used the mapped result as pointer to the private history table of 2-bit counters. Branch direction prediction would be done at the IF/ID stage, and the output of the branch target prediction would be added as an input to the PCMUX with the branch prediction being the select. BHR, the 2-bit counter of the corresponding entry, and the BTB would be updated in the EX_MEM state when branch direction and address are fully resolved.

MP3 Progress Report Checkpoint 3

This checkpoint, we implemented data forwarding and full hazard detection including control, data, and structural hazards. The L2 cache is complete and integrated. We also started working on static branch prediction, and modifying the L2 cache to be 4-way set associative. Josh designed the forwarding unit, Nodens implemented the forwarding unit and worked on branch prediction, and Alex completed the L2 cache and started modifying the cache to be 4-way. Everyone participated in debugging.

Roadmap for CP4
Next checkpoint we will finish static branch prediction as well as implement an eviction write buffer and software visible performance counters. We will also be planning for CP5, deciding which features we want to implement and may take steps in CP4 so that CP5 can be completed more smoothly. Nodens will implement static branch prediction, Alex will implement the eviction write buffer, Josh will implement the software visible performance counters.



MP3 Progress Report Checkpoint 2
This checkpoint, we implemented all remaining LC3b instructions. We also added the two split L1 caches, and L2 cache, and the Wishbone interconnect logic to handle the connection betweeen L1 and L2. All the instructions how function correctly. Both cache levels work correctly and the L2 cache interfaces with physical memory correctly. The design uses multi-cycle L2 accesses. Nodens and Josh implemented the instructions. Alex implemented the caches and Wishbone interconnect. 



Roadmap for CP3
In CP3, we will deal with all the possible hazards including the data hazard and the branch hazard. We would be implementing the forwarding mechanism for the next checkpoint, and this could be done with the addition of several muxes along with a forwarding unit which checks forwarding logic from the lecture slides based on the memory read and write signals. After this the pipelined CPU should be able to handle any LC3b code without the need of NOP instructions.
In addition to that, we would be adding an additional layer of cache, L2, between the 2 separated L1 caches and the physical memory. L2 should be able to contain all the data that are in L1. The wishbone interconnect added in the CP2 would be modified so that the L1 cache first communicate with the L2 cache, and the L2 cache will communicate with the physical memory and propagate any missed data into L1. The interconnect will involve a series of muxes that will decide which master signals to send to the Wishbone. The slave signals will be connected to both masters directly, except for ACK which will go through a decoder so only one master will receive the slave data. The control signals for these muxes and decoder will be handled by an arbiter in the form of a state machine besides that all the physical memory usages in the CP2 would be replaced by the L2 cache. An additional layer of logic like that done in the MP2 would be added between the L1 cache and the physical memory. The L2 cache would establish another wishbone interconnect as the master with the physical memory.

Nodens and Josh will be responsible for handling all the possible hazards.
Alex will be responsible for adding the L2 cache including modifying the interconnect and the state machine.  



MP3 Progress Report Checkpoint 1
This is the first checkpoint of the MP3 and we built a basic pipelined CPU with two main components – a pipelined datapath and a ROM controller. The datapath now does not need a large control unit like the previous non-pipelined CPU design besides the rather simple ROM controller. It fetches and decodes different instructions every single cycle. The generates ROM controller generates the necessary control signals for each instruction such as aluop, mux selections, and is_branch signals, and store them in the pipeline (flip-flops) in the next stage along with the computational results from other units. There are 4 main pipelines in our design which allows us to have a maximum of 5 stages, and the signals stored from the previous stage can be retrieved from the pipeline output in the instruction’s current stage.
We have tested and verified the correctness of the ADD, ADDi, AND, ANDi, NOT, LDR, STR, and BR instructions, providing there are enough NOP signals before the BR instruction determine whether to branch.
We have not dealt with any possible data hazards, control hazards, nor the branch hazards yet, i.e. we have not implement the stall and forward mechanism yet. We also have not taken the memory ready signals into account since the magic memory provided this week would instantly respond high resp whenever it receives a read or write signal. The caches were also not included in our current design yet.
In this checkpoint, Nodens wrote the datapath and the ROM controller, Alex wrote the testbench, and Joshua configured the connection to the memory. We all participated in debugging.



Roadmap for CP2
In CP2, we will be implementing the functionality for all LC3b instructions not already implemented in CP1. We will also be adding a Wishbone interconnect such that both L1 caches will be able to communicate with physical memory. This will be expanded in CP3 to include an L2 cache that the L1 caches will communicate with before resorting to physical memory. The interconnect will involve a series of muxes that will decide which master signals to send to the Wishbone. The slave signals will be connected to both masters directly, except for ACK which will go through a decoder so only one master will receive the slave data. The control signals for these muxes and decoder will be handled by an arbiter in the form of a state machine.

Nodens and Josh will be responsible for the remaining LC3b instructions.
Alex will be responsible for the interconnect including state machine.
Josh will also be researching data forwarding and other relevant information for future checkpoints.



Questions
Should pmem connect only to L2 or to both L2 and L1 caches at once?

Which cache should have priority when both are requesting at once?
How to handle one L1 cache dominating the wb? Let one dominate vs keep track of least recently used and take turns when both requesting at once.


