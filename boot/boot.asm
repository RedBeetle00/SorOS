bits 16
org 0x7c00

start:
	xor ax, ax
	mov ds, ax
	mov es, ax
	mov ss, ax
	mov sp, 0x7c00

	mov ah, 0x02
	mov al, 4
	mov ch, 0
	mov cl, 2
	mov dh, 0
	mov bx, 0x1000
	mov es, bx
	xor bx, bx
	int 0x13
	jc disk_error

	cli

	lgdt [gdt_descriptor]
	
	mov eax, cr0
	or eax, 1
	mov cr0, eax

	jmp 0x08:protected_mode

disk_error:
	mov si, error_msg
	call print_string
	jmp $

print_string:
    mov ah, 0x0e
.loop:
    lodsb
    test al, al
    jz .done
    int 0x10
    jmp .loop
.done:
    ret

error_msg db "Disk error!", 0


gdt_start:
	dq 0

	dw 0xffff
	dw 0x0000
	db 0x00
	db 10011010b
	db 11001111b
	db 0x00

	dw 0xffff
	dw 0x0000
	db 0x00
	db 10010010b
	db 11001111b
	db 0x00
gdt_end:

gdt_descriptor:
	dw gdt_end - gdt_start - 1
	dd gdt_start

[bits 32]
protected_mode:
	mov ax, 0x10
	mov ds, ax
	mov es, ax
	mov fs, ax
	mov gs, ax
	mov ss, ax

	mov esp, 0x90000

	mov dword [0xb8000], 0x2f4b2f4E
	
	jmp 0x08:0x10000
	
times 510-($-$$) db 0

dw 0xaa55
