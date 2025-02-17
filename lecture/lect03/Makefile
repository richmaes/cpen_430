# Specify the top-level module for simulation
TB_MODULE = shiftcomp_tb

RTL_FILES = shifter.sv 
RTL_FILES += compare.sv 
RTL_FILES += shiftcomp.sv
RTL_FILES += iclk.sv
RTL_FILES += irst.sv

VSIM_CMD = vsim -c $(TB_MODULE) 
VSIM_CMD += -do "run.do"
.PHONY: compile clean

default: shiftcomp_tb
# Main target: using the top-level module as the target name
shiftcomp_tb: 
	@echo "Compiling $(RTL_FILES) $(TB_MODULE).sv with vlog..."
	vlog $(RTL_FILES) $(TB_MODULE).sv
	@echo "Starting simulation for $(TB_MODULE) structural coding style..."
	$(VSIM_CMD)

# Clean up generated files (adjust as needed)
clean:
	@echo "Cleaning up simulation files..."
	rm -rf work transcript vsim.wlf
