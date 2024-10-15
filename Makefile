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
	${CPP} ${CPPFLAGS} -o vgsasm ${OBJECTS}

bracket.o: src/bracket.cpp src/*.h
	${CPP} ${CPPFLAGS} -c $< -o $@

define.o: src/define.cpp src/*.h
	${CPP} ${CPPFLAGS} -c $< -o $@

file.o: src/file.cpp src/*.h
	${CPP} ${CPPFLAGS} -c $< -o $@

formulas.o: src/formulas.cpp src/*.h
	${CPP} ${CPPFLAGS} -c $< -o $@

label.o: src/label.cpp src/*.h
	${CPP} ${CPPFLAGS} -c $< -o $@

line.o: src/line.cpp src/*.h
	${CPP} ${CPPFLAGS} -c $< -o $@

mnemonic.o: src/mnemonic.cpp src/*.h
	${CPP} ${CPPFLAGS} -c $< -o $@

numeric.o: src/numeric.cpp src/*.h
	${CPP} ${CPPFLAGS} -c $< -o $@

operand.o: src/operand.cpp src/*.h
	${CPP} ${CPPFLAGS} -c $< -o $@

sizeof.o: src/sizeof.cpp src/*.h
	${CPP} ${CPPFLAGS} -c $< -o $@

struct.o: src/struct.cpp src/*.h
	${CPP} ${CPPFLAGS} -c $< -o $@

main.o: src/main.cpp src/*.h
	${CPP} ${CPPFLAGS} -c $< -o $@
