global  _main
extern _asprintf
extern _dprintf
extern _strchr
extern _system


section .text
_main:
    push rbp
    mov rbp, rsp

    mov r15, 5
    cmp r15, 0
	jle finale

    lea rdi, [rel macr]
    mov rsi, 95
    call _strchr
    cmp rax, 0
    je create_child

    dec r15

create_child:
    lea rdi, [rsp]
    lea rsi, [rel prog_name]
    mov rdx, r15
    call _asprintf

    mov rdi, [rsp]
    mov rsi, 0q03001
    mov rdx, 0q644
    mov rax, 0x02000005
    syscall

    mov rdi, rax
    lea rsi, [rel prog_str]
    mov rdx, 34
    mov rcx, 10
    lea r8, [rel prog_str]
    mov r9, r15
    call _dprintf

    mov rax, 0x02000006
    syscall

    lea rdi, [rsp]
    lea rsi, [rel cmd]
    mov rdx, r15
    call _asprintf

    mov rdi, [rsp]
    call _system
finale:
    mov rax, 0
    leave
    ret

section	.data
    prog_str: db "global  _main%2$cextern _asprintf%2$cextern _dprintf%2$cextern _strchr%2$cextern _system%2$c%2$c%2$csection .text%2$c_main:%2$c    push rbp%2$c    mov rbp, rsp%2$c%2$c    mov r15, %4$d%2$c    cmp r15, 0%2$c	jle finale%2$c%2$c    lea rdi, [rel macr]%2$c    mov rsi, 95%2$c    call _strchr%2$c    cmp rax, 0%2$c    je create_child%2$c%2$c    dec r15%2$c%2$ccreate_child:%2$c    lea rdi, [rsp]%2$c    lea rsi, [rel prog_name]%2$c    mov rdx, r15%2$c    call _asprintf%2$c%2$c    mov rdi, [rsp]%2$c    mov rsi, 0q03001%2$c    mov rdx, 0q644%2$c    mov rax, 0x02000005%2$c    syscall%2$c%2$c    mov rdi, rax%2$c    lea rsi, [rel prog_str]%2$c    mov rdx, 34%2$c    mov rcx, 10%2$c    lea r8, [rel prog_str]%2$c    mov r9, r15%2$c    call _dprintf%2$c%2$c    mov rax, 0x02000006%2$c    syscall%2$c%2$c    lea rdi, [rsp]%2$c    lea rsi, [rel cmd]%2$c    mov rdx, r15%2$c    call _asprintf%2$c%2$c    mov rdi, [rsp]%2$c    call _system%2$cfinale:%2$c    mov rax, 0%2$c    leave%2$c    ret%2$c%2$csection	.data%2$c    prog_str: db %1$c%3$s%1$c, 0%2$c    cmd: db %1$cnasm -f macho64 Sully_%%1$d.s && gcc -o Sully_%%1$d Sully_%%1$d.o && rm Sully_%%1$d.o && ./Sully_%%1$d%1$c, 0%2$c    prog_name: db %1$cSully_%%d.s%1$c, 0%2$c    macr: db __FILE__, 0%2$c", 0
    cmd: db "nasm -f macho64 Sully_%1$d.s && gcc -o Sully_%1$d Sully_%1$d.o && rm Sully_%1$d.o && ./Sully_%1$d", 0
    prog_name: db "Sully_%d.s", 0
    macr: db __FILE__, 0
