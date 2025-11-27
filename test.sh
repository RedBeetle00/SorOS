#!/bin/bash

nasm boot/boot.asm -o boot.bin
nasm kernel/bootloadertest.asm -o load.bin

cat boot.bin load.bin > image.bin

dd if=/dev/zero of=disk.img bs=1M count=1

dd if=image.bin of=disk.img conv=notrunc

qemu-system-x86_64 -drive format=raw,file=disk.img
