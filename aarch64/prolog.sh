#!/bin/bash
set -xe

if ! command -v bunzip2 >/dev/null 2>&1; then
    echo "ERROR: bunzip2 not found"
    exit 1
fi

mkdir -p rom
FILE="edk2-aarch64-code.fd"
CURRENT_PATH=$(pwd)
git clone -j$(nproc) --depth=1 https://github.com/qemu/qemu.git
cd "$CURRENT_PATH/qemu"
bunzip2 -k pc-bios/"$FILE".bz2
cp -pv pc-bios/"$FILE" ../rom
cd ..
rm -rf qemu
