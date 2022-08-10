# Debian ISO Customizer

This repo is intended to help creating an unattended Debian Desktop.

## Extract Debian ISO

First get the Debian __DVD__ (the CD and net and mini installs are not suitable now).

You can get it here:
[https://cdimage.debian.org/debian-cd/current/amd64/iso-dvd/](https://cdimage.debian.org/debian-cd/current/amd64/iso-dvd/)

Then execute `extract_iso.sh` as root with its parameters:
```
sudo ./extract_iso.sh path/to/debian/iso
```

## Extract initrd

Debian ISO must have been extracted first

