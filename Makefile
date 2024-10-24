CPP = g++
CPPFLAGS = -std=c++17 -g
HEADERS = src/common.h
OBJECTS = vgsasm.o mnemonic.o 

all: vgsasm

check: vgsasm
	./vgsasm -o all.bin test/all.asm
	z88dk.z88dk-dis all.bin >test/all_disassemble.asm
	diff test/all_expect.asm test/all_disassemble.asm

update:
	cp test/all_disassemble.asm test/all_expect.asm

clean:
	rm -f ${OBJECTS}
	rm -f vgsasm

vgsasm: ${OBJECTS}
	${CPP} ${CPPFLAGS} -o vgsasm ${OBJECTS}

vgsasm.o: src/vgsasm.cpp ${HEADERS} src/*.h src/*.hpp
	${CPP} ${CPPFLAGS} -c $< -o $@

mnemonic.o: src/mnemonic.cpp ${HEADERS} src/mnemonic.h src/mnemonic_*.hpp
	${CPP} ${CPPFLAGS} -c $< -o $@
