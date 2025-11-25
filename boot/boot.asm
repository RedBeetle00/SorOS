bits 16
org 0x7c00

start:
	mov ah, 0x00
	mov al, 0x0a
	int 0x10

	mov ah, 0x02
	mov dh, 0
	mov dl, 0
	mov bh, 0
	int 0x10

	mov ah, 0x09
	mov al, 65
	mov bh, 0
	mov bl, 4
	mov cx, 4
	int 0x10

	jmp $

times 510-($-$$) db 0

dw 0xaa55
