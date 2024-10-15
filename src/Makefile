CPP = g++
CPPFLAGS = -std=c++17 -O2
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
	rm -f ../vgsasm

vgsasm: ${OBJECTS}
	${CPP} ${CPPFLAGS} -o ../vgsasm ${OBJECTS}

.SUFFIXES: .o .cpp

.cpp.o:
	${CPP} ${CPPFLAGS} -c $< -o $@
