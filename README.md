# Wisp

Wisp is a set of simple scripts for setting up small QEMU-based Virtual Machines. (Because I'm an old boomer who hates Docker. (don't @ me))

# Quick Start

```console
$ ./$ARCH/install.sh arch-btw-$ARCH.iso urmom.qcow2
$ ./$ARCH/run.sh urmom.qcow2 10022
$ ssh user@localhost -p10022
```

So far `$ARCH`-s we support are:
- [x86_64](./x86_64/)
- [aarch64](./aarch64/)
