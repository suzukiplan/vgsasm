all: vgsasm

vgsasm: src/*
	g++ -std=c++11 -O2 -o vgsasm src/main.cpp
