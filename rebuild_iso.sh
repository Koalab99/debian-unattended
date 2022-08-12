#!/bin/bash

# Get root access
if [[ $EUID -ne 0 ]]; then
    echo "Reexec as root"
    sudo $0 $@
    exit $?
fi

# Get output ISO name
OUTPUT="$1"
while [[ "x$OUTPUT" == "x" ]]
do
    read -e -p "What is the name of the output iso file ? " OUTPUT
done

# Generate ISO
#mkisofs -r -V "Custom Debian Install CD" \
#            -cache-inodes \
#            -J -l -b isolinux/isolinux.bin \
#            -c isolinux/boot.cat -no-emul-boot \
#            -boot-load-size 4 -boot-info-table \
#            -o $OUTPUT iso

xorriso -as mkisofs \
   -r -V 'Debian Custom' \
   -o "$OUTPUT" \
   -J -J -joliet-long -cache-inodes \
   -isohybrid-mbr /usr/lib/ISOLINUX/isohdpfx.bin \
   -b isolinux/isolinux.bin \
   -c isolinux/boot.cat \
   -boot-load-size 4 -boot-info-table -no-emul-boot \
   -eltorito-alt-boot \
   -e boot/grub/efi.img \
   -no-emul-boot \
   -isohybrid-gpt-basdat \
   -isohybrid-apm-hfsplus \
    iso

