; Expects all interupt parameters (see https://stanislavs.org/helppc/int_13-2.html)
disk_read:
	push si
	push ax

	xor si, si
	mov ah, 0x02

.loop:
	push ax
	int 0x13
	jc .fail
	pop ax

.end:
	pop ax
	pop si
	ret

.fail:
	push si
	push bx
	mov si, .fmsg
	call print_str
	mov bl, ah
	xor bh, bh
	call print_hex
	mov bx, 0x0a0d
	call print_char
	pop bx
	pop si

	pop ax
	inc si
	cmp si, 0x03
	jl .loop
	jmp $

.fmsg: db "disk_read failed with status ", 0x0
