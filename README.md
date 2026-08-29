# Verilog Mini Projects

A collection of digital logic design mini-projects implemented in Verilog. This repository serves as a personal learning hub and reference guide for foundational to intermediate RTL (Register-Transfer Level) design concepts, including memory architecture, Finite State Machines (FSMs), and data flow control.

## Tech Stack & Tools

All projects in this repository are developed and tested using the following open-source toolchain:
* **Code Editor:** [Visual Studio Code (VS Code)](https://code.visualstudio.com/)
* **Compiler/Simulator:** [Icarus Verilog (`iverilog`)](http://iverilog.icarus.com/)
* **Waveform Viewer:** VaporView (VS Code Extension) or [GTKWave](https://gtkwave.sourceforge.net/)

## Repository Structure

Each folder contains the Verilog design files (`.v`), testbenches (`tb.v`), and specific `README.md` files with details about that individual project.

## General Simulation Guide

To simulate any of the projects in this repository locally, follow these standard steps:

### 1. Navigate to the project directory
Open your terminal and `cd` into the specific project folder you want to run.
```bash
cd "Name of Project Folder"
```
### 2. Compile the design and testbench
Use Icarus Verilog to compile the source code into an executable simulation file (named `sim_out`). 
*(Note: If the testbench includes the design files via  `include` , you may only need to pass the testbench file to the compiler).*
```bash
iverilog -o sim_out design.v tb.v
```

### 3. Run the simulation
Execute the compiled file to run the simulation. This will generate a `.vcd` (Value Change Dump) file in the same folder.
```bash
vvp sim_out
```

### 4. View the Waveforms
To visualize the signals and timing diagrams, open the generated `.vcd` file using **VaporView** directly inside VS Code, or load it externally using **GTKWave**.
