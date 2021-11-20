# makefile for function4, circle and rect
../../dist/function4: ../../dist/function4.o ../../dist/circle.o ../../dist/rect.o
	gcc -g -o ../../dist/function4 ../../dist/function4.o ../../dist/circle.o ../../dist/rect.o -no-pie
../../dist/function4.o: function4.asm
	nasm -o ../../dist/function4.o -f elf64 -g -F dwarf function4.asm -l ../../dist/function4.lst
../../dist/circle.o: circle.asm
	nasm -o ../../dist/circle.o -f elf64 -g -F dwarf circle.asm -l ../../dist/circle.lst
../../dist/rect.o: rect.asm
	nasm -o ../../dist/rect.o -f elf64 -g -F dwarf rect.asm -l ../../dist/rect.lst
