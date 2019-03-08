%define i 5
%defstr NASM /Users/romontei/.brew/bin/nasm -f macho64
%defstr NAME Sully_ %+ i

%macro OPEN 0
    lea rdi, [rel file.name]
    mov rsi, 0x0202
    mov rdx, 644o
    mov rax, 0x2000005
    syscall
%endmacro

%macro PRINT 1
    lea rsi, [rel %1]
    mov rdx, 10
    mov rcx, 59
    mov r8, 34
    lea r9, [rel %1]
    call _dprintf
%endmacro

%macro BUILD 0
	lea	rdi, [rel file.build]
	call	_system
%endmacro

%macro EXEC 0
	lea	rdi, [rel file.exec]
	call	_system
%endmacro

%macro MAIN 0
    section .data
    code:
        .string db "%%macro OPEN 0%1$c    lea rdi, [rel file.name]%1$c    mov rsi, 0x0202%1$c    mov rdx, 644o%1$c    mov rax, 0x2000005%1$c    syscall%1$c%%endmacro%1$c%1$c%%macro PRINT 1%1$c    lea rsi, [rel %%1]%1$c    mov rdx, 10%1$c    mov rcx, 59%1$c    mov r8, 34%1$c    lea r9, [rel %%1]%1$c    call _dprintf%1$c%%endmacro%1$c%1$c%%macro MAIN 0%1$c    section .data%1$c    code:%1$c        .string db %3$c%4$s%3$c, 0%1$c%1$c    file:%1$c        .name db %3$cGrace_kid.s%3$c, 0%1$c%1$c    section .text%1$c        global start%1$c        global _main%1$c        extern _dprintf%1$c%1$c    start:%1$c        call _main%1$c        ret%1$c%1$c    _main:%1$c        push rbp%1$c        mov rbp, rsp%1$c        sub rsp, 16%1$c        OPEN%1$c        mov rdi, rax%1$c        PRINT code.string%1$c        mov rax, 0x2000006%1$c        syscall%1$c        leave%1$c        ret%1$c%%endmacro%1$c%1$c%2$c Call the define that lets the magic begin%1$cMAIN%1$c", 0

    file:
        .name db NAME, ".s", 0
		.build: db NASM, 32, NAME, ".s", " -o ", NAME, ".o", 0
        .exec db "./", NAME, 0

    section .text
        global start
        global _main
        extern _printf
        extern _dprintf
        extern _system

    start:
        call _main
        ret

    _main:
        push rbp
        mov rbp, rsp
        sub rsp, 16
        OPEN
        mov rdi, rax
        PRINT code.string
        mov rax, 0x2000006
        syscall
        ;mov rax, i
        ;cmp rax, 0
		BUILD
        EXEC
        leave
        ret
%endmacro

; Call the define that lets the magic begin
MAIN
