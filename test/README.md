# Tests
You can test your iso with these scripts

## Create a disk to install debian on
You might want to have a disk to install debian on. Here is how to create a 8GB QCOW disk.
```
qemu-img create -f qcow2 test.img 8G
```

# BIOS
For BIOS systems, you can install your debian with the command:
```
qemu-system-x86_64 \
    -m 4G \
    -smp 4 \
    -cpu host \
    -accel kvm \
    -hda test.img \
    -cdrom mydebian.iso
```

The VM will have:
- 4GB of RAM
- 4 CPU
- 1 Disk "test.img"
- Boot from cdrom "mydebian.iso"

# UEFI
You need to install OVMF.

Then:
```
qemu-system-x86_64 \
    -m 4G \
    -smp 4 \
    -cpu host \
    -accel kvm \
    -hda test.img \
    -boot menu=on \
    -bios /usr/share/ovmf/OVMF.fd \
    -cdrom mydebian.iso
```

You might encouter error when rebooting your VM. See here for more informations:
https://pve.proxmox.com/wiki/OVMF/UEFI_Boot_Entries
