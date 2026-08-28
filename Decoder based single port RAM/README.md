# 32x8 Decoder-Based RAM

This project implements a 32-word by 8-bit (32x8) Synchronous Random Access Memory by cascading four smaller 8x8 RAM modules. It features an address decoder and a shared bidirectional data bus using tri-state logic.

## Architecture
To achieve a depth of 32 words, a 5-bit address bus is used:
* **Lower 3 bits (`addr[2:0]`)**: Route to all four 8x8 RAM blocks to select the specific word inside the active block.
* **Upper 2 bits (`addr[4:3]`)**: Route into a 2-to-4 decoder to generate Chip Select (`cs`) signals, ensuring only one 8x8 RAM block is active at any given time.
* **Data Bus (`inout`)**: A shared 8-bit bidirectional bus used for both writing data into and reading data from the memory. 

## Files
* **`design.v`**: The core 8x8 RAM module (`ram_8x8`) featuring an `inout` data port, chip select (`cs`), and synchronous read/write operations.
* **`tb.v`**: The top-level testbench. It instantiates four `ram_8x8` modules, contains the 2-to-4 address decoder logic, handles the tri-state buffer driving the data bus, and simulates write/read sequences across different memory banks.

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
Running the simulation will automatically generate a `waveform.vcd` file. Open this file in **GTKWave** to view the timing diagrams and verify the tri-state bus and chip select signals.
<img width="1568" height="718" alt="image" src="https://github.com/user-attachments/assets/85337bbc-9beb-4bb9-b1b4-382957ac289f" />
