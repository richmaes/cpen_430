# Specify the top-level module for simulation
TB_MODULE = mux_tb
VSIM_CMD = vsim -c $(TB_MODULE) 
VSIM_CMD += -do "run.do"
.PHONY: compile clean

# Main target: using the top-level module as the target name
mux_tb: 
	@echo "Compiling with vlog..."
	vlog mux_rtl.sv $(TB_MODULE).sv
	@echo "Starting simulation for $(TB_MODULE) structural coding style..."
	$(VSIM_CMD)

# Clean up generated files (adjust as needed)
clean:
	@echo "Cleaning up simulation files..."
	rm -rf work transcript vsim.wlf
