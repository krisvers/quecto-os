TARGET=build/quecto.bin
AS=nasm
CC=gcc
CFLAGS=-ffreestanding -c

$(TARGET): build/boot.bin build/kernel.bin
	cat $^ > $(TARGET)

build/boot.bin: source/boot/*
	$(AS) -f bin -o $@ source/boot/main.asm

build/kernel.bin: build/kernel.o build/entry.o
	ld -Ttext 0x1000 --oformat=binary -o $@ $^

build/kernel.o: source/kernel/*
	$(CC) $(CFLAGS) -o $@ source/kernel/*.c

build/entry.o: source/kernel/entry.asm
	$(AS) -f elf64 -o $@ $<

clean:
	rm -rf build/*
