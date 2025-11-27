bits 32
[org 0x10000]

start:
	mov dword [0xb8000], 0x2f4b22f5
	
	jmp $

times 2048-($-$$) db 0
