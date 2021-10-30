BITS 64
;alive.asm
section .data
  msg1 db "Hello, world!", 0xA, 0
  msg1len equ $ - msg1 - 1
  msg2 db "Alive and Kicking!", 0xA, 0
  msg2len equ $ - msg2 - 1
  radius dq 357
  pi dq 3.14
section .bss
section .text
  global main
main:
  push rbp
  mov rbp, rsp
  mov rax, 1
  mov rdi, 1
  mov rsi, msg1
  mov rdx, msg1len
  syscall
  mov rax, 1
  mov rdi, 1
  mov rsi, msg2
  mov rdx, msg2len
  syscall
  mov rsp, rbp
  pop rbp
  mov rax, 60
  mov rdi, 0
  syscall
