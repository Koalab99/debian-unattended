#!/bin/bash

# Usage function, just for documentation purpose
usage() {
    cat <<EOF
usage: $0 <ISO>
    ISO: path to the vanilla ISO file
EOF
}

# Get root access
if [[ $EUID -ne 0 ]]; then
    echo "Reexec as root"
    sudo $0 $@
    exit $?
fi

# Get the path of the ISO file if it was not provided
FILE="$1"
while [[ ! -e "$FILE" ]]
do
    read -e -p "Please enter the path to the ISO file: " FILE
done

# Mount ISO to a temporary directory (read only)
ISO_MOUNT_DIRECTORY=$(mktemp -d)
mount -o loop,ro "$FILE" "$ISO_MOUNT_DIRECTORY"

# Copy content of the ISO to a defined read/write directory
mkdir -p iso
cp -r "$ISO_MOUNT_DIRECTORY"/* iso

# Umount read only ISO
umount $ISO_MOUNT_DIRECTORY
