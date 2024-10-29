CPP = g++ -std=c++17 -g
MAK = @make --no-print-directory
DEPS = common.hpp ../src/*
TEST_MODULES =\
	assignment \
	binary \
	bracket_to_address \
	bracket_eliminate \
	decimal \
	define_parse \
	define_replace \
	enum \
	formulas_evaluate \
	formulas_evaluate_array \
	increment \
	label_parse \
	label_parse_jump \
	label_extract_anonymous \
	literal \
	nametable \
	numeric \
	offset_parse \
	offset_replace \
	operand \
	org \
	sizeof_parse \
	sizeof_replace

all:
	make execute
	@make execute >result.txt
	@echo Normal case: `cat result.txt | grep -o -c "^N:"`
	@echo Error case: `cat result.txt | grep -o -c -e "^E:" -e "^Error:"`
	@echo Total: `cat result.txt | grep -o -c "^[NE]:"`

execute: ${TEST_MODULES}
	./assignment
	./binary
	./bracket_to_address
	./bracket_eliminate
	./decimal
	./define_parse
	./define_replace
	./enum
	./formulas_evaluate
	./formulas_evaluate_array
	./increment
	./label_parse
	./label_parse_jump
	./label_extract_anonymous
	./literal
	./nametable
	./numeric
	./offset_parse
	./offset_replace
	./operand
	./org
	./sizeof_parse
	./sizeof_replace
	${MAK} struct_tests

single: sizeof_replace
	./sizeof_replace

clean:
	rm -f ${TEST_MODULES}

assignment: assignment.cpp ${DEPS}
	${CPP} $< -o $@

binary: binary.cpp ${DEPS}
	${CPP} $< -o $@

bracket_to_address: bracket_to_address.cpp ${DEPS}
	${CPP} $< -o $@

bracket_eliminate: bracket_eliminate.cpp ${DEPS}
	${CPP} $< -o $@

decimal: decimal.cpp ${DEPS}
	${CPP} $< -o $@

define_parse: define_parse.cpp ${DEPS}
	${CPP} $< -o $@

define_replace: define_replace.cpp ${DEPS}
	${CPP} $< -o $@

enum: enum.cpp ${DEPS}
	${CPP} $< -o $@

formulas_evaluate: formulas_evaluate.cpp ${DEPS}
	${CPP} $< -o $@

formulas_evaluate_array: formulas_evaluate_array.cpp ${DEPS}
	${CPP} $< -o $@

increment: increment.cpp ${DEPS}
	${CPP} $< -o $@

label_parse: label_parse.cpp ${DEPS}
	${CPP} $< -o $@

label_parse_jump: label_parse_jump.cpp ${DEPS}
	${CPP} $< -o $@

label_extract_anonymous: label_extract_anonymous.cpp ${DEPS}
	${CPP} $< -o $@

literal: literal.cpp ${DEPS}
	${CPP} $< -o $@

nametable: nametable.cpp ${DEPS}
	${CPP} $< -o $@

numeric: numeric.cpp ${DEPS}
	${CPP} $< -o $@

offset_parse: offset_parse.cpp ${DEPS}
	${CPP} $< -o $@

offset_replace: offset_replace.cpp ${DEPS}
	${CPP} $< -o $@

operand: operand.cpp ${DEPS}
	${CPP} $< -o $@

org: org.cpp ${DEPS}
	${CPP} $< -o $@

sizeof_parse: sizeof_parse.cpp ${DEPS}
	${CPP} $< -o $@

sizeof_replace: sizeof_replace.cpp ${DEPS}
	${CPP} $< -o $@

check: check.cpp
	${CPP} $< -o $@

../vgsasm: ../src/*
	cd .. && make

struct_tests: check ../vgsasm
	@echo Testing: struct
	@./check "`../vgsasm struct_notop.asm`" "\`struct\` must appear at the beginning of the line."
	@./check "`../vgsasm struct_dup_field.asm`" "Duplicate field name \`VAR1\` in struct \`HOGE\`"
	@./check "`../vgsasm struct_name_dot.asm`" "Invalid structure name: HOGE.COM"
	@./check "`../vgsasm struct_arrow_no.asm`" "Incorrect syntax for struct arrow."
	@./check "`../vgsasm struct_arrow_same.asm`" "Incorrect syntax for struct arrow."
	@./check "`../vgsasm struct_arrow_inval.asm`" "Incorrect syntax for struct arrow."
	@./check "`../vgsasm struct_arrow_array_empty.asm`" "Unexpected symbol: ]"
	@./check "`../vgsasm struct_arrow_array_inval.asm`" "Unexpected symbol: HIGE"
	@./check "`../vgsasm struct_arrow_array_uex.asm`" "Unexpected symbol: 2"
	@./check "`../vgsasm struct_arrow_array_zero.asm`" "struct array must have a value of 1 or more: 0"
	@./check "`../vgsasm struct_noaddr.asm`" "Incorrect syntax for struct: ADDR"
	${MAK} normal_case src=struct_noaddr2
	@./check "`../vgsasm struct_noscope1.asm`" "Invalid \`}\` without corresponding \`{\`."
	@./check "`../vgsasm struct_noscope2.asm`" "The scope \`{\` specified in this line is not closed with \`}\`."
	@./check "`../vgsasm struct_arrow_seq1.asm`" "It must be defined on the line after the definition of struct specified by the arrow operator."
	@./check "`../vgsasm struct_arrow_seq2.asm`" "It must be defined on the line after the definition of struct specified by the arrow operator."
	@./check "`../vgsasm struct_field_dot.asm`" "Invalid structure field name: VAR.FOO"
	@./check "`../vgsasm struct_field_inv1.asm`" "Invalid field VAR1 in structure HOGE"
	@./check "`../vgsasm struct_field_inv2.asm`" "Invalid field VAR1 in structure HOGE"
	@./check "`../vgsasm struct_field_nnum.asm`" "Specify non-numeric number of field VAR1 in structure HOGE: AAA"
	@./check "`../vgsasm struct_field_nstr.asm`" "Unknown structure name FOO specified in field VAR1 of structure HOGE"
	@./check "`../vgsasm struct_field_cir.asm`" "Detects circular references between structures"
	@./check "`../vgsasm struct_field_uk.asm`" "Unknown field name in structure HOGE: VAR2"
	@./check "`../vgsasm struct_array_empty.asm`" "Illegal array structure element: ]"
	@./check "`../vgsasm struct_array_ill.asm`" "Illegal array structure element: FOO"
	@./check "`../vgsasm struct_array_mul.asm`" "Illegal array structure element: 2"
	@./check "`../vgsasm struct_array_nd.asm`" "Invalid array field designation: VAR1"
	@./check "`../vgsasm struct_field_nf.asm`" "Unknown field name in structure HOGE: VAR2"
	${MAK} normal_case src=struct_normal

normal_case:
	@echo N: ${src}
	../vgsasm ${src}.asm -v
	diff ${src}.bin ${src}.exp
