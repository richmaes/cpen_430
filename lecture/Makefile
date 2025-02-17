# List your SystemVerilog source files
VLOG_LECT01_FILES = lect01.sv lect01_tb.sv

# Specify the top-level module for simulation
TOP_LECT01_MODULE = lect01_tb

.PHONY: compile clean

# Main target: using the top-level module as the target name
lect01_tb: lect01 
	@echo "Starting simulation for $(TOP_LECT01_MODULE)..."
	vsim -c $(TOP_LECT01_MODULE) -do "run.do"

# Compile the source files
lect01:
	@echo "Compiling with vlog..."
	vlog $(VLOG_LECT01_FILES)

# Clean up generated files (adjust as needed)
clean:
	@echo "Cleaning up simulation files..."
	rm -rf work transcript vsim.wlf
