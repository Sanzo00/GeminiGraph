ROOT_DIR= $(shell pwd)
TARGETS= toolkits/bc toolkits/bfs toolkits/cc toolkits/pagerank toolkits/sssp inputs/convert
MACROS= 
# MACROS= -D PRINT_DEBUG_MESSAGES

MPICXX= mpicxx
CXX = g++
CXXFLAGS= -O3 -Wall -std=c++11 -g -fopenmp -march=native -I$(ROOT_DIR) $(MACROS)
SYSLIBS= -lnuma
HEADERS= $(shell find . -name '*.hpp')

all: $(TARGETS)

toolkits/%: toolkits/%.cpp $(HEADERS)
	$(MPICXX) $(CXXFLAGS) -o $@ $< $(SYSLIBS)

inputs/convert: inputs/convert.cpp
	$(CXX) $(CXXFLAGS) -o $@ $<

clean: 
	rm -f $(TARGETS)

