all: assignments
	./assignments

assignments: assignments.cpp common.hpp ../src/*
	g++ -std=c++17 -g $< -o $@
