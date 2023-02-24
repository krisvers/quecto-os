; Expects all interupt parameters (see https://stanislavs.org/helppc/int_13-2.html)
disk_read:
	xor si, si
	int 0x13
	jc .fail

;smth_else:
;	push si
;	push ax
;
;	xor si, si
;	mov ah, 0x02

.loop:
	int 0x13
	jc .fail

.end:
	ret

.fail:
	push si
	mov si, .fmsg
	call print_str
	mov bl, ah
	xor bh, bh
	call print_hex
	mov bx, 0x0a0d
	call print_char
	pop si

	inc si
	cmp si, 0x03
	jl .loop
	jmp $

.fmsg: db "disk_read failed with status ", 0x0
