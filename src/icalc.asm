;icalc.asm
extern printf
section .data
  number1 dq 128
  number2 dq 19
  neg_num dq -12
  fmt db "The numbers are %ld and %ld", 10, 0
  fmtint db "%s %ld", 10, 0
  sumi db "The sum is", 0
  diifi db "The difference is", 0
  inci db "Number 1 Incremented:", 0
  deci db "Number 1 Decremented", 0
  sali db "Number 1 Shift left 2(x4):", 0
  sari db "Number 1 Shift right 2 (/4):", 0
  sariex db "Number 1 Shift right 2 (/4) with "
       db "sign extension:", 0
  multi db "The product is", 0
  divi db "The integer quorient is", 0
  remi db "The modulo is", 0
section .bss
  resulti resq 1
  modulo resq 1
section .text
  global main
main:
  push rbp
  mov rbp, rsp
; showing numbers
  mov rdi, fmt
  mov rsi, [number1]
  mov rdx, [number2]
  mov rax, 0
  call printf
; sum
  mov rax, [number1]
  add rax, [number2]
  mov [resulti], rax
  mov rdi, fmtint
  mov rsi, sumi
  mov rdx, [resulti]
  mov rax, 0
  call printf
; sub
  mov rax, [number1]
  sub rax, [number2]
  mov [resulti], rax
  mov rdi, fmtint
  mov rsi, diifi
  mov rdx, [resulti]
  mov rax, 0
  call printf
; inc
  mov rax, [number1]
  inc rax
  mov [resulti], rax
  mov rdi, fmtint
  mov rsi, inci
  mov rdx, [resulti]
  mov rax, 0
  call printf
; dec
  mov rax, [number1]
  dec rax
  mov [resulti], rax
  mov rdi, fmtint
  mov rsi, deci
  mov rdx, [resulti]
  mov rax, 0
  call printf
; sal
  mov rax, [number1]
  sal rax, 2
  mov [resulti], rax
  mov rdi, fmtint
  mov rsi, sali
  mov rdx, [resulti]
  mov rax, 0
  call printf
; sar
  mov rax, [number1]
  sar rax, 2
  mov [resulti], rax
  mov rdi, fmtint
  mov rsi, sari
  mov rdx, [resulti]
  mov rax, 0
  call printf
; neg sar
  mov rax, [neg_num]
  sar rax, 2
  mov [resulti], rax
  mov rdi, fmtint
  mov rsi, sariex
  mov rdx, [resulti]
  mov rax, 0
  call printf
; imul
  mov rax, [number1]
  imul qword [number2]
  mov [resulti], rax
  mov rdi, fmtint
  mov rsi, multi
  mov rdx, [resulti]
  mov rax, 0
  call printf
; idiv
  mov rax, [number1]
  mov rdx, 0
  idiv qword [number2]
  mov [resulti], rax
  mov [modulo], rdx
  mov rdi, fmtint
  mov rsi, divi
  mov rdx, [resulti]
  mov rax, 0
  call printf
  mov rdi, fmtint
  mov rsi, remi
  mov rdx, [modulo]
  mov rax, 0
  call printf

  mov rsp, rbp
  pop rbp
  ret
