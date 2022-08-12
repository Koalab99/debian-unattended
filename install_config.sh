#!/bin/bash

PRESEED_URL="$1"
DOMAIN="$2"
DEFAULT_HOSTNAME="$3"

# Get root access
if [[ $EUID -ne 0 ]]; then
    echo "Reexec as root"
    sudo $0 $@
    exit $?
fi

if [[ "x$PRESEED_URL" == "x" ]]
then
    echo "No preseed URL given"
    exit 0
fi

if [[ "x$DOMAIN" == "x" ]]
then
    DOMAIN="localdomain"
fi

if [[ "x$DEFAULT_HOSTNAME" == "x" ]]
then
    DEFAULT_HOSTNAME="host"
fi

# Copy grub config
# For UEFI
cp config/grub.cfg iso/boot/grub/grub.cfg
sed -i -e "s,PRESEED_URL,$PRESEED_URL,g;s,DOMAIN,$DOMAIN,g;s,HOST,$DEFAULT_HOSTNAME,g" iso/boot/grub/grub.cfg
# For BIOS
cp config/isolinux.cfg iso/isolinux/menu.cfg 
sed -i -e "s,PRESEED_URL,$PRESEED_URL,g;s,DOMAIN,$DOMAIN,g;s,HOST,$DEFAULT_HOSTNAME,g" iso/isolinux/menu.cfg

# Update md5sum.txt
cd iso
chmod +w md5sum.txt
# Expect warning
find -L -type f ! -name md5sum.txt -print0 | xargs -0 md5sum >md5sum.txt
chmod -w md5sum.txt
cd ..


