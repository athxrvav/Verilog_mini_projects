# Synchronous FIFO System with Producer-Consumer Modules

This project implements an 8x8 Synchronous FIFO buffer integrated with two peripheral control modules. The system demonstrates a standard producer-consumer data flow where one module writes data into the buffer and another module extracts it using a Finite State Machine (FSM).

## System Architecture

The project consists of the following interconnected modules:

*   **`mod_a.v` (Producer):** Contains module `a`, which takes top-level input data, synchronizes it, and asserts a write-enable (`wr_enb`) signal to push data into the FIFO.
*   **`fifo.v` (Buffer):** Contains `fif0_8x8`, an 8-word deep by 8-bit wide synchronous FIFO. It manages internal read/write pointers and generates `full` and `empty` flags to prevent data overwrite or underflow.
*   **`mod_b.v` (Consumer):** Contains module `b`, which utilizes a 3-state FSM (`idle`, `s1`, `data_state`). It asserts a read-enable (`rd_enb`) signal to extract data from the FIFO and pass it to the top-level output.
*   **`top_fifo.v` (Top Level):** Contains `topmodule`, which wires module A, the FIFO, and module B together using internal wire connections. 
*   **`tb.v` (Testbench):** The simulation testbench that applies clock, reset, and data stimuli to verify the flow of data through the system.

## How to Run the Simulation

*Note: Testbench (`tb.v`) currently utilizes `` `include `` directives for all the sub-modules. Therefore, you only need to pass the testbench file to the compiler.*

Run the following commands in your terminal:

### 1. Compile the code
```bash
iverilog -o sim_out tb.v
```
### 2. Run the simulation
```bash
vvp sim_out
```

### 3. View the waveforms
Running the simulation will automatically generate a `waveform.vcd` file. Open this file in **GTKWave** to view the timing diagrams and verify the FSM transitions and FIFO pointer logic.


<img width="1835" height="841" alt="image" src="https://github.com/user-attachments/assets/b5feac02-7dc5-479e-9016-65cc180ec0bf" />
