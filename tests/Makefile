TEST_MODULES =\
	assignment \
	binary \
	bracket_to_address

all: ${TEST_MODULES}
	./assignment
	./binary
	./bracket_to_address

clean:
	rm -f ${TEST_MODULES}

assignment: assignment.cpp common.hpp ../src/*
	g++ -std=c++17 -g $< -o $@

binary: binary.cpp common.hpp ../src/*
	g++ -std=c++17 -g $< -o $@

bracket_to_address: bracket_to_address.cpp common.hpp ../src/*
	g++ -std=c++17 -g $< -o $@
