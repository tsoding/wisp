#!/bin/sh

set -xe

ISO_PATH="$1"
QCOW2_IMAGE="$2"

# TODO: check if the user didn't provide enough arguments

qemu-img create -f qcow2 "$QCOW2_IMAGE" 20G
qemu-system-x86_64 -enable-kvm \
                   -m 4096 \
                   -cdrom "$ISO_PATH" \
                   -hda "$QCOW2_IMAGE"
                   -boot d
