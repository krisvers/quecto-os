[bits 16]
switch_32:
	cli
	lgdt [gdt_desc]
	mov eax, cr0
	or eax, 0x01
	mov cr0, eax
	jmp code_seg:init_32

[bits 32]
init_32:
	mov ax, data_seg
	mov ds, ax
	mov ss, ax
	mov es, ax
	mov fs, ax
	mov gs, ax

	mov ebp, 0x90000
	mov esp, ebp

	call begin_32
