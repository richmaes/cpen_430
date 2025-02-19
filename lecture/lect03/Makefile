# Specify the top-level module for simulation
TB_FILES = shiftcomp_tb.sv

TOP_MODULE = shiftcomp_tb
TOP_OPT_MODULE = $(TOP_MODULE)_opt

RTL_FILES = shifter.sv 
RTL_FILES += compare.sv 
RTL_FILES += shiftcomp.sv
RTL_FILES += iclk.sv
RTL_FILES += irst.sv

all: shiftcomp_tb

include ../Makefile.include

.PHONY: compile clean

# Main target: using the top-level module as the target name
shiftcomp_tb: TEST_MSG = "Starting simulation for $(TOP_MODULE)"
shiftcomp_tb: compile optimize simulate
