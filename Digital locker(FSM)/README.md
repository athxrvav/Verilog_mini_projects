# Digital Locker (FSM Sequence Detector)

This project implements a digital locker system using a Finite State Machine (FSM) written in Verilog. The locker acts as a sequence detector that unlocks only when the correct 4-bit binary password is entered sequentially.

## Overview
* **Password:** `1010`
* **Architecture:** Mealy/Moore FSM (hybrid based on output logic)
* **Data Input:** Serial bit-by-bit input (`data_in`).

## State Machine Details
The FSM consists of the following states to track the user's input:
* **`idle`**: The default locked state. Waits for the first correct bit (`1`).
* **`s1`, `s2`, `s3`**: Intermediate states tracking the successful entry of the sequence `1`, `10`, and `101`.
* **`unlock_state`**: Reached when the full `1010` sequence is entered correctly. The `unlocked` signal goes high.
* **`error_state`**: Reached if an incorrect bit is entered at any point. The system tracks the number of errors and requires the `submit` signal to reset back to `idle`.

## Files
* **`design.v`**: Contains the FSM logic, state transitions, and error-counting mechanisms.
* **`tb.v`**: The testbench that simulates a user entering the sequence, applying a reset, and using the submit button.

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
Running the simulation will automatically generate a `waveform.vcd` file. Open this file in **GTKWave** to view the timing diagrams and verify the state transitions.
<img width="1103" height="365" alt="image" src="https://github.com/user-attachments/assets/c2f07df8-342b-402a-a71e-aaf953f1282c" />
