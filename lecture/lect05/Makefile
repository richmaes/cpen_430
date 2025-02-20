# Specify the top-level module for simulation
TB_FILES = dff_tb.v
TB_FILES += += iclk.sv

TOP_MODULE = dff_tb
TOP_OPT_MODULE = $(TOP_MODULE)_opt

RTL_FILES = dff_async.v 
RTL_FILES += dff_sync.v 
RTL_FILES += dff.v

all: dff_tb

include ../Makefile.include

.PHONY: compile clean

# Main target: using the top-level module as the target name
dff_tb: TEST_MSG = "Starting simulation for $(TOP_MODULE)"
dff_tb: simulate
