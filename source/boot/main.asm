[org 0x7c00]

[bits 16]
init:
	mov bp, 0x9000
	mov sp, bp

	mov al, 0x02
	mov ch, 0x00
	mov cl, 0x02
	mov dh, 0x00
	mov bx, kernel_begin
	call disk_read

	call switch_32

%include "source/boot/disk.asm"
%include "source/boot/print.asm"
%include "source/boot/gdt32.asm"
%include "source/boot/switch32.asm"

[bits 32]
begin_32:
	jmp [kernel_begin]
	jmp $

kernel_begin equ 0x1000

times 510-($-$$) db 0
dw 0xaa55
