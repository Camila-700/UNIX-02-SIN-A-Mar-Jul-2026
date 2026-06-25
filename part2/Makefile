ASM=nasm
CC=x86_64-elf-gcc
LD=x86_64-elf-ld

CFLAGS=-ffreestanding -fno-stack-protector -fno-pic -mno-red-zone -m64 -Wall -Wextra -std=gnu99 -c
LDFLAGS=-n -T targets/x86_64/linker.ld

BUILD_DIR=build
ISO_DIR=$(BUILD_DIR)/isodir

OBJS=$(BUILD_DIR)/header.o \
     $(BUILD_DIR)/main.o \
     $(BUILD_DIR)/long_mode.o \
     $(BUILD_DIR)/kernel.o

all: $(BUILD_DIR)/kernel.iso

$(BUILD_DIR)/header.o: src/boot/header.asm
	mkdir -p $(BUILD_DIR)
	$(ASM) -f elf64 $< -o $@

$(BUILD_DIR)/main.o: src/boot/main.asm
	mkdir -p $(BUILD_DIR)
	$(ASM) -f elf64 $< -o $@

$(BUILD_DIR)/long_mode.o: src/boot/long_mode.asm
	mkdir -p $(BUILD_DIR)
	$(ASM) -f elf64 $< -o $@

$(BUILD_DIR)/kernel.o: src/kernel.c
	mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) $< -o $@

$(BUILD_DIR)/kernel.bin: $(OBJS)
	$(LD) $(LDFLAGS) -o $@ $(OBJS)

$(BUILD_DIR)/kernel.iso: $(BUILD_DIR)/kernel.bin targets/x86_64/grub.cfg
	mkdir -p $(ISO_DIR)/boot/grub
	cp $(BUILD_DIR)/kernel.bin $(ISO_DIR)/boot/kernel.bin
	cp targets/x86_64/grub.cfg $(ISO_DIR)/boot/grub/grub.cfg
	grub-mkrescue -o $@ $(ISO_DIR)

verify: $(BUILD_DIR)/kernel.bin
	grub-file --is-x86-multiboot2 $(BUILD_DIR)/kernel.bin
	echo "OK: kernel.bin is Multiboot2"

clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean verify