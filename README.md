# rpi-check-overscan
A shell script and systemd service unit file to ensure overscan is disabled
on Raspberry Pis running Debian-based systems.

## What
The contents of this directory are simply:
* `check-overscan`: a shell script to check if `disable_overscan=1` is in the Raspberry Pi's
`config.txt` file and add it if it isn't
* `check-overscan.service`: a systemd unit file to run `check-overscan.sh` at shutdown or reboot
* `install.sh`: a shell script to install and enable the script and service, as well as disable
and uninstall them (in that order)
* `README.md`: this document

## Why
On the vanilla Debian arm64 Raspberry Pi image, updating the kernel overwrites any changes
made to `config.txt`. This script and service make sure you don't forget to add back
`disable_overscan=1`.

## How (Usage)
To install the service, simply download this repository (such as cloning it with git), enter it,
and run `install.sh` with root privileges.
```
git clone https://github.com/Marie-Joseph/rpi-check-overscan.git
cd rpi-check-overscan
sudo sh install.sh
```
To uninstall it, simply run `install.sh` again with `--uninstall` or `-u`.
```
cd rpi-check-overscan
sudo sh install.sh --uninstall
```

Note that on Raspberry Pi OS, the Raspberry Pi Foundation's spin of Debian, the
path to `config.txt` is slightly different. For these cases, simply edit the
path for `configFile` in `check-overscan.sh` with a text editor.
