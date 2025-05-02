#!/bin/sh

set -xe

QCOW2_IMAGE="$1"
SSH_PORT="$2"

# TODO: check if the user didn't provide enough arguments

qemu-system-aarch64 \
    -cpu cortex-a53 -smp cores=4 \
    -nographic \
    -M virt -m 4096 \
    -bios /usr/share/qemu/edk2-aarch64-code.fd \
    -drive format=qcow2,file="$QCOW2_IMAGE" \
    -device ramfb \
    -device e1000,netdev=net0 \
    -netdev user,id=net0,hostfwd=tcp::"$SSH_PORT"-:22 \
    -rtc base=utc,clock=host
