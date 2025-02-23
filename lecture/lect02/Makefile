# List your SystemVerilog source files
TB_FILES = mux_tb.sv
RTL_FILES = mux_rtl.sv
# Specify the top-level module for simulation
TOP_MODULE = mux_tb
TOP_OPT_MODULE = $(TOP_MODULE)_opt

all: mux_tb

include ../Makefile.include

.PHONY: mux_tb clean 

# Main target: using the top-level module as the target name
mux_tb: TEST_MSG = "Starting simulation for $(TOP_MODULE)" 
mux_tb: simulate

