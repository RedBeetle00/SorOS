bits 16
org 0x7c00

start:
	mov si, msg
	call clean_screen
	jmp $

clean_screen:
	mov ah, 0x06
	mov al, 0x00
	mov ch, 0
	mov cl, 0
	mov dh, 24
	mov dl, 79
	mov bh, 0x07
	int 0x10

print_string:

	mov ah, 0x0e
.loop:
	lodsb
	cmp al, 0
	je .done
	int 0x10
	jmp .loop

.done:
	ret

msg db "Holla Amigos",0
times 510-($-$$) db 0
dw 0xaa55
