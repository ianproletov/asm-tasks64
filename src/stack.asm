; stack.asm
extern printf
section .data
  strng db "ABCDE", 0
  strngLen equ $ - strng - 1
  fmt1 db "The original string: %s", 10, 0
  fmt2 db "The reversed string: %s", 10, 0
section .bss
section .text
  global main
main:
    mov rbp, rsp; for correct debugging
  push rbp
  mov rbp, rsp
; show initial string
  mov rdi, fmt1
  mov rsi, strng
  mov rax, 0
  call printf
; push string to the stack
  xor rax, rax
  mov rbx, strng
  mov rcx, strngLen
  mov r12, 0
  pushLoop:
    mov al, byte [rbx + r12]
    push rax
    inc r12
    loop pushLoop
;reverse
  mov rbx, strng
  mov rcx, strngLen
  mov r12, 0
  popLoop:
    pop rax
    mov byte [rbx + r12], al
    inc r12
    loop popLoop
    mov byte [rbx+12], 0
; show reversed string
  mov rdi, fmt2
  mov rsi, strng
  mov rax, 0
  call printf
mov rsp, rbp
pop rbp
ret
