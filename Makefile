CPP = g++
CPPFLAGS = -std=c++17 -g
OBJECTS = \
	bracket.o \
	define.o \
	file.o \
	formulas.o \
	label.o \
	line.o \
	mnemonic.o \
	numeric.o \
	operand.o \
	sizeof.o \
	struct.o \
	main.o

all: vgsasm

clean:
	rm -f ${OBJECTS}
	rm -f vgsasm

vgsasm: ${OBJECTS}
	${CPP} ${CPPFLAGS} -o vgsasm ${OBJECTS}

bracket.o: src/bracket.cpp
	${CPP} ${CPPFLAGS} -c $< -o $@

define.o: src/define.cpp
	${CPP} ${CPPFLAGS} -c $< -o $@

file.o: src/file.cpp
	${CPP} ${CPPFLAGS} -c $< -o $@

formulas.o: src/formulas.cpp
	${CPP} ${CPPFLAGS} -c $< -o $@

label.o: src/label.cpp
	${CPP} ${CPPFLAGS} -c $< -o $@

line.o: src/line.cpp
	${CPP} ${CPPFLAGS} -c $< -o $@

mnemonic.o: src/mnemonic.cpp
	${CPP} ${CPPFLAGS} -c $< -o $@

numeric.o: src/numeric.cpp
	${CPP} ${CPPFLAGS} -c $< -o $@

operand.o: src/operand.cpp
	${CPP} ${CPPFLAGS} -c $< -o $@

sizeof.o: src/sizeof.cpp
	${CPP} ${CPPFLAGS} -c $< -o $@

struct.o: src/struct.cpp
	${CPP} ${CPPFLAGS} -c $< -o $@

main.o: src/main.cpp
	${CPP} ${CPPFLAGS} -c $< -o $@
