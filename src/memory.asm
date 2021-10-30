;memory.asm
section .data
  bNum db 123
  wNum dw 12345
  warray times 5 dw 0
  dNum dd 12345
  qNum1 dq 12345
  text1 db "abc", 0xA
  qNum2 dq 3.141592654
  text2 db "cde", 0
section .bss
  bVar resb 1
  dVar resd 1
  wVar resw 10
  qVar resq 3
section .text
  global main
main:
    mov rbp, rsp; for correct debugging
  push rbp
  mov rbp, rsp
  lea rax, [bNum]
  mov rax, bNum
  xor rax, rax
  mov al, [bNum]
  mov [bVar], al
  lea rax, [bVar]
  lea rax, [wNum]
  mov rax, [wNum]
  lea rax, [text1]
  mov rax, text1
  mov rax, text1 + 1
  lea rax, [text1 + 1]
  mov rax, [text1]
  mov rax, [text1 + 1]
  mov rsp, rbp
  pop rbp
  ret

