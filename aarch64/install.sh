#!/bin/sh

set -xe

ISO_PATH="$1"
QCOW2_IMAGE="$2"

# TODO: check if the user didn't provide enough arguments

qemu-img create -f qcow2 "$QCOW2_IMAGE" 20G
qemu-system-aarch64 \
    -cpu cortex-a53 -smp cores=4 \
    -nographic \
    -M virt -m 4096 \
    -bios /usr/share/qemu/edk2-aarch64-code.fd \
    -drive format=qcow2,file="$QCOW2_IMAGE" \
    -device ramfb \
    -cdrom "$ISO_PATH" \
    -nic user,model=virtio \
    -rtc base=utc,clock=host
