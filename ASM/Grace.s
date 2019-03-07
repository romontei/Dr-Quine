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
	mov rcx, 9
	mov r8, 34
	lea r9, [rel %1]
	mov r10, 59
	call _dprintf
%endmacro

%macro MAIN 0
	section .data
	code:
		.string db "%5$cJE suisu %%macro OPEN 0%1$c%2$clea rdi, [rel file.name]%1$c%2$cmov rsi, 0x0202%1$c%2$cmov rdx, 644o%1$c%2$cmov rax, 0x2000005%1$c%2$csyscall%1$c%%endmacro%1$c%1$c%%macro PRINT 1%1$c%2$clea rsi, [rel %%1]%1$c%2$cmov rdx, 10%1$c%2$cmov rcx, 9%1$c%2$cmov r8, 34%1$c%2$cmov r9, 59%1$c%2$clea r10, [rel %%1]%1$c%2$ccall _dprintf%1$c%%endmacro%1$c%1$c%%macro MAIN 0%1$c%2$csection .data%1$c%2$ccode:%1$c%2$c%2$c.string db %3$c%4$s%3$c%1$c%1$c%2$cfile:%1$c%2$c%2$c.name db %3$cGrace_kid.s%3$c, 0%1$c%1$c%2$csection .text%1$c%2$c%2$cglobal start%1$c%2$c%2$cglobal _main%1$c%2$c%2$cextern _printf%1$c%1$c%2$cstart:%1$c%2$c%2$ccall _main%1$c%2$c%2$cret%1$c%1$c%2$c_main:%1$c%2$c%2$cpush rbp%1$c%2$c%2$cmov rbp, rsp%1$c%2$c%2$csub rsp, 16%1$c%2$c%2$cOPEN%1$c%2$c%2$cmov rdi, rax%1$c%2$c%2$cPRINT code.string%1$c%2$c%2$cmov rcx, 34%1$c%2$c%2$cmov r8, 59%1$c%2$c%2$clea r9, [rel hello.string]%1$c%2$c%2$ccall _printf%1$c%2$c%2$cleave%1$c%2$c%2$cret%1$c%%endmacro%1$c"
	
	file:
		.name db "Grace_kid.s", 0
	
	section .text
		global start
		global _main
		extern _dprintf
	
	start:
		call _main
		ret
	
	_main:
		push rbp
		mov rbp, rsp
		sub rsp, 16
		OPEN
		;mov rdi, rax
		PRINT code.string
		mov rax, 0x2000006
		syscall
		leave
		ret
%endmacro

MAIN
