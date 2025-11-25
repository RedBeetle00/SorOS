#!/bin/bash

nasm boot.asm -o boot.bin

dd if=/dev/zero of=disk.img bs=1M count=1

dd if=boot.bin of=disk.img conv=notrunc

qemu-system-x86_64 -drive format=raw,file=disk.img
