gdt_start:
	dd 0x0, 0x0

gdt_code:
	dw 0xffff
	dw 0x0
	db 0x0
	db 0b10011010
	db 0b11001111
	db 0x0

gdt_data:
	dw 0xffff
	dw 0x0
	db 0x0
	db 0b10010011
	db 0b11001111
	db 0x0

gdt_end:

gdt_desc:
	dw gdt_end - gdt_start - 1
	dd gdt_start

code_seg: equ gdt_code - gdt_start
data_seg: equ gdt_data - gdt_start
