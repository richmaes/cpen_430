# List your SystemVerilog source files
TB_FILES = lect01_tb.v

# Specify the top-level module for simulation
TOP_MODULE = lect01_tb
TOP_OPT_MODULE = $(TOP_MODULE)_opt

all: lect01a_tb

include ../Makefile.include

.PHONY: lect01a_tb lect01b_tb lect01c_tb clean help

# Main target: using the top-level module as the target name
lect01a_tb: TEST_MSG = "Starting simulation for $(TOP_MODULE) structural coding style..."
lect01a_tb: RTL_FILES = lect01a.v
lect01a_tb: simulate
	

# Main target: using the top-level module as the target name
lect01b_tb: TEST_MSG = "Starting simulation for $(TOP_MODULE) concurrent coding style..."
lect01b_tb: RTL_FILES = lect01b.v
lect01b_tb: simulate
	

# Main target: sequential RTL coding
lect01c_tb: TEST_MSG = "Starting simulation for $(TOP_MODULE) sequential coding style..."
lect01c_tb: RTL_FILES = lect01c.v
lect01c_tb: simulate


