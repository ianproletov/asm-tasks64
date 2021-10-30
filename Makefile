#makefile for hello.asm
dist/$(source): dist/$(source).o
	gcc -o dist/$(source) dist/$(source).o -no-pie
dist/$(source).o: src/$(source).asm
	nasm -o dist/$(source).o -f elf64 -g -F dwarf src/$(source).asm -l dist/$(source).lst
build:
	@(for f in $$(find src -name '*.asm'); do	filename=$$(basename $$f .asm); make source=$$filename;	done)
