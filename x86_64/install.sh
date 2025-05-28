#!/bin/sh

set -xe

ISO_PATH="$1"
QCOW2_IMAGE="$2"

if [ -z "$ISO_PATH" ] || [ -z "$QCOW2_IMAGE" ]; then
    echo "Usage:\n\t$0 <path-to-iso> <path-to-qcow2-image>"
    exit 1
fi

qemu-img create -f qcow2 "$QCOW2_IMAGE" 20G
qemu-system-x86_64 -enable-kvm \
                   -m 4096 \
                   -cdrom "$ISO_PATH" \
                   -hda "$QCOW2_IMAGE" \
                   -boot d
