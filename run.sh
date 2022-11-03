#!/bin/sh

set -xe

QCOW2_IMAGE="$1"
SSH_PORT="$2"

# TODO: check if the user didn't provide enough arguments

qemu-system-x86_64 -enable-kvm \
                   -m 4096 \
                   -hda "$QCOW2_IMAGE" \
                   -netdev user,id=net0,hostfwd=tcp::"$SSH_PORT"-:22 \
                   -device e1000,netdev=net0 \
                   -nographic \
