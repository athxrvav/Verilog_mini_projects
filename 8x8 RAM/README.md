# 8x8 Synchronous RAM

A simple synchronous Random Access Memory (RAM) designed in Verilog, capable of storing 8 words of 8 bits each. <img width="1024" height="559" alt="image" src="https://github.com/user-attachments/assets/65b1a921-c85c-4b27-93aa-f5bd17d5d334" />


## Files
* **`design.v`**: The main RAM module (`ram_8x8`) featuring synchronous read/write operations and an active-high reset.
* **`tb.v`**: The testbench (`tb_8x8_ram`) used to verify the memory block. It applies reset conditions, writes data to specific addresses, and reads the data back.

## How to Run the Simulation

This project is configured to be simulated using Icarus Verilog and viewed with GTKWave. Open your terminal in the project directory and run the following commands:

### 1. Compile the code
```bash
iverilog -o sim_out design.v tb.v
```
### 2. Run the simulation
```bash
vvp sim_out
```

### 3. View the waveforms
Running the simulation will automatically generate a `waveforms.vcd` file. Open this file in **GTKWave** to view the timing diagrams and signal changes.

<img width="1840" height="511" alt="Screenshot From 2026-08-28 17-29-07" src="https://github.com/user-attachments/assets/82f089af-5804-4ce2-bd8d-340502da4fdf" />
