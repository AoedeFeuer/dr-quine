%macro grace_prog 0
_main:
    push rbp
    mov rbp, rsp
    lea rdi, [rel prog_name]
    lea rsi, [rel mode]
    call _fopen
    cmp rax, 0
    je err

    mov r12, rax
    mov rax, 0

    mov rdi, r12
    lea rsi, [rel prog_str]
    mov rdx, 34
    mov rcx, 10
    lea r8, [rel prog_str]
    call _fprintf
    mov rax, 0

    mov rdi, r12
    call _fclose
    mov rax, 0
    leave
    ret
err:
    mov       rax, 0x02000001
    xor       rdi, -1
    syscall
%endmacro

global  _main
extern _fprintf
extern _fopen
extern _fclose
; The program consists of two identical parts, once as plain code and once quoted in some way.
section .text
    grace_prog

section	.data
    prog_name: db "Grace_kid.s", 0
    prog_str: db "%%macro grace_prog 0%2$c_main:%2$c    push rbp%2$c    mov rbp, rsp%2$c    lea rdi, [rel prog_name]%2$c    lea rsi, [rel mode]%2$c    call _fopen%2$c    cmp rax, 0%2$c    je err%2$c%2$c    mov r12, rax%2$c    mov rax, 0%2$c%2$c    mov rdi, r12%2$c    lea rsi, [rel prog_str]%2$c    mov rdx, 34%2$c    mov rcx, 10%2$c    lea r8, [rel prog_str]%2$c    call _fprintf%2$c    mov rax, 0%2$c%2$c    mov rdi, r12%2$c    call _fclose%2$c    mov rax, 0%2$c    leave%2$c    ret%2$cerr:%2$c    mov       rax, 0x02000001%2$c    xor       rdi, -1%2$c    syscall%2$c%%endmacro%2$c%2$cglobal  _main%2$cextern _fprintf%2$cextern _fopen%2$cextern _fclose%2$c; The program consists of two identical parts, once as plain code and once quoted in some way.%2$csection .text%2$c    grace_prog%2$c%2$csection	.data%2$c    prog_name: db %1$cGrace_kid.s%1$c, 0%2$c    prog_str: db %1$c%3$s%1$c, 0%2$c    mode: db %1$cw+%1$c, 0%2$c", 0
    mode: db "w+", 0
