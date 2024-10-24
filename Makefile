CPP = g++
CPPFLAGS = -std=c++17 -g
HEADERS = src/common.h

all: vgsasm

check: vgsasm
	./vgsasm -o all.bin test/all.asm
	z88dk.z88dk-dis all.bin >test/all_disassemble.asm
	diff test/all_expect.asm test/all_disassemble.asm

update:
	cp test/all_disassemble.asm test/all_expect.asm

clean:
	rm -f vgsasm

vgsasm: src/vgsasm.cpp ${HEADERS} src/*.h src/*.hpp
	${CPP} ${CPPFLAGS} -o vgsasm $<
