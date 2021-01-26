# rpi-check-overscan
A shell script and systemd service unit file to ensure overscan is disabled
on Raspberry Pis running Debian-based systems.

## Overview
This simply does what it says on the tin. The shell script `check-overscan.sh` does the "hard"
work of iterating over the lines of `/boot/firmware/config.txt` and adding
`disable_overscan=1` if it's not found. The unit file `check-overscan.service`
just tells systemd that we want to run this check on poweroff or reboot, as
vanilla Debian overwrites `config.txt` on kernel upgrades.

## Installation
You should be able to simply run `install.sh` with privileges (eg `sudo sh install.sh`) and everything
will be done for you. Note that this has not been tested anywhere but vanilla
Debian arm64 using Raspberry Pi 4-compatible images. `uninstall.sh` will simply remove the files and disable the service.

