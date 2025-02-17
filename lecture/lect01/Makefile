# List your SystemVerilog source files
VLOG_LECT01_FILES = lect01_tb.sv

# Specify the top-level module for simulation
TOP_LECT01_MODULE = lect01_tb
VSIM_CMD = vsim -c $(TOP_LECT01_MODULE) 
VSIM_CMD += -do "run.do"
.PHONY: compile clean

# Main target: using the top-level module as the target name
lect01a_tb: 
	@echo "Compiling with vlog..."
	vlog lect01a.sv $(VLOG_LECT01_FILES)
	@echo "Starting simulation for $(TOP_LECT01_MODULE) structural coding style..."
	$(VSIM_CMD)

# Main target: using the top-level module as the target name
lect01b_tb:
	@echo "Compiling with vlog..."
	vlog lect01b.sv $(VLOG_LECT01_FILES) 
	@echo "Starting simulation for $(TOP_LECT01_MODULE) concurrent coding style..."
	$(VSIM_CMD)

# Main target: sequential RTL coding
lect01c_tb:
	@echo "Compiling with vlog..."
	vlog lect01c.sv $(VLOG_LECT01_FILES) 
	@echo "Starting simulation for $(TOP_LECT01_MODULE) sequential coding style..."
	$(VSIM_CMD)

# Clean up generated files (adjust as needed)
clean:
	@echo "Cleaning up simulation files..."
	rm -rf work transcript vsim.wlf
