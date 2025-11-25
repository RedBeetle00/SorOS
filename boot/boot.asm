bits 16
org 0x7c00

start:
	call print_privatstvie
	jmp $

print_privatstvie:
	; screen clear
	mov ah, 0x06
	mov al, 0x00
	mov bh, 0x07
	mov cx, 0x0000
	mov dx, 0x184f
	int 0x10

	; videomode
	mov ah, 0x00
	mov al, 0x0a
	int 0x10

	; cursor pos
	mov ah, 0x02
	mov dh, 0
	mov dl, 0
	mov bh, 0
	int 0x10

	;symbol write
	mov ax, 0x1300
	mov bx, 0x0004
	mov cx, 12
	mov dx, 0x0820
	mov bp, msg
	int 0x10

	ret
	
msg db "Hello, man",0

times 510-($-$$) db 0

dw 0xaa55
