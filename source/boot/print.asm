%define endl 0x0a, 0x0d

; Accepts string in %si ending with 0
print_str:
	push si
	push ax
	mov ah, 0x0e

.loop:
	mov al, [si]
	test al, al
	jz .end
	int 0x10
	inc si
	jmp .loop

.end:
	pop ax
	pop si
	ret

; Accepts value in %bx
print_hex:
	push cx
	push bx
	push ax
	xor cl, cl
	mov ah, 0x0e

	mov al, 0x30
	int 0x10
	mov al, 0x78
	int 0x10

.loop:
	mov al, bh
	shr al, 0x04
	cmp al, 0x09
	jle .dump
	add al, 0x27

.dump:
	add al, 0x30
	int 0x10
	cmp cl, 0x03
	je .end
	inc cl
	shl bx, 0x04
	jmp .loop

.end:
	pop ax
	pop bx
	pop cx
	ret

; Accepts 2 ascii values in %bl, %bh
print_char:
	push ax
	mov ah, 0x0e

	mov al, bl
	int 0x10
	mov al, bh
	int 0x10

	pop ax
	ret
