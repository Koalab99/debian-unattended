# Debian ISO Customizer

This repo is intended to help creating an unattended Debian Desktop.

## Extract Debian ISO

First get the Debian Net Installer (any other might be OK, but not tested)

You can get it here:
[https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/)

Then execute `extract_iso.sh` as root with its parameters:
```
sudo ./extract_iso.sh path/to/debian/iso
```

## Modify kernel parameters

Installation process can be automated using a preseed file. However the installer needs to know where it can find the preseed. This information can be given as a kernel parameter, in GRUB and ISOLINUX configuration. Both of those files can be found under `/config/`. ISOLINUX is used for BIOS mode and GRUB for UEFI mode.

You can install the configuration to the ISO using:
```
./install_config.sh <PRESEED_URL> [<DOMAIN> [<DEFAULT_HOSTNAME>]]

Parameters:
    PRESEED_URL         URL of the preseed file
    DOMAIN              The domain to add during the installation (default: localdomain)
    DEFAULT_HOSTNAME    The hostname to add temporarily (default: host)
```

## Regenerate the ISO file
```
./rebuild_iso.sh [OUTPUT_FILE]
```

## Test your ISO
See [/test directory](test/README.md) for examples using qemu.

## Sources

[Debian Installer Preseed Wiki](https://wiki.debian.org/DebianInstaller/Preseed/EditIso)

[Automating the installation using preseeding](https://www.debian.org/releases/stable/s390x/apbs04.en.html)
