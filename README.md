
# DFX Memory System

This repository contains a TCL script setup for DFX Memory System project using Xilinx Vivado. The project automates the creation and configuration of a memory system design, including the necessary source files and constraints.

## 1. Requirements

To use this project, ensure you have the following:

- **Xilinx Vivado Design Suite** (2024.1)
- **Operating System**: Linux (Ubuntu 22.04 or similar)
- **TCL Scripting Knowledge**: Basic understanding of TCL for Vivado automation

## 2. Quick Start

Follow these steps to set up and generate the DFX memory system project in Vivado:

1. **Clone the Repository**
   ```bash
   # With https
   git clone https://github.com/Dark-GreenCat/memory_system.git

   # With ssh
   # git clone git@github.com:Dark-GreenCat/memory_system.git

   cd memory_system
   ```

2. **Update the .coe File Path**
   - Open `Vivado/build.tcl` in a text editor.
   - Search for the absolute path to the `.coe` file.
   - Replace it with the absolute path to your `.coe` file, located in `Vivado/memory_system/memory_system.srcs`.

3. **Run the TCL Script**
   - Open Xilinx Vivado.
   - Go to **Window > Tcl Console**.
   - Navigate to the project folder:
     ```tcl
     cd /path/to/memory-system/Vivado
     ```
   - Execute the script:
     ```tcl
     source build.tcl
     ```
   - Vivado will generate the project, including all necessary IP cores, source files, and constraints.

4. **Verify the Project**
   - Open the generated project in Vivado (`Vivado/memory_system/memory_system.xpr`).
   - Check the design hierarchy and ensure the memory system components are correctly instantiated.
   - Run synthesis and implementation to validate the design.

## 3. Guide to Export Project

To export the Vivado project for sharing or version control, follow these steps to create a portable TCL script:

1. **Generate the Initial `build.tcl`**
   - In Vivado, open your project.
   - Go to **File > Project > Write Project Tcl**.
   - Save the file as `build.tcl` in the `Vivado/memory_system` directory. (not in the old `Vivado` directory)
   - Execute commands:
     ```bash
     cp Vivado/memory_system/build.tcl Vivado
     ```

2. **Modify `build.tcl`**
   - Open `build.tcl` in a text editor.
   - Replace the following line:
     ```tcl
     set origin_dir "."
     ```
     With:
     ```tcl
     set origin_dir [file dirname [info script]]
     ```
   - Replace:
     ```tcl
     create_project myproject ./myproject
     ```
     With:
     ```tcl
     create_project myproject $origin_dir/myproject
     ```
   - These changes ensure the script uses relative paths, making it portable across different systems.

3. **Copy Source Files**
   - Copy the `memory_system.srcs` directory from `Vivado/memory_system/memory_system.srcs` to `Vivado/`.
      ```bash
     cp Vivado/memory_system.srcs/*.coe Vivado
     rm -rf Vivado/memory_system.srcs
     cp -r Vivado/memory_system/memory_system.srcs Vivado
     mv Vivado/*.coe Vivado/memory_system.srcs
     ```
   - Verify that all source files, including the `.coe` file, are included in the copied directory.
   - To export simulated .vcd file:
      ```bash
     cp Vivado/memory_system/memory_system.sim/sim_1/behav/xsim/sim_top_u250.vcd Vivado/sim
     ```

4. **Test the Exported Script**
   - Open Vivado and navigate to the `Vivado` directory in the Tcl Console:
     ```tcl
     cd /path/to/memory-system/Vivado
     ```
   - Run:
     ```tcl
     source build.tcl
     ```
   - Confirm that the project is recreated correctly with all sources and configurations intact.

## 4. Additional Notes

- Ensure the `.coe` file is correctly formatted for the memory system. Incorrect formats may cause errors during synthesis.
- If you encounter path-related issues, double-check the absolute paths in `build.tcl` and ensure all files are accessible.
- For large designs, synthesis and implementation may take significant time. Ensure your system has adequate resources (CPU, RAM).
- To customize the memory system, modify the source files in `Vivado/memory_system/memory_system.srcs` before running the script.

