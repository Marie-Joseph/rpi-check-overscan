# rpi-check-overscan
A pure shell script and systemd service unit file to ensure overscan is disabled
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

## Overclocking
There are two maintained branches of this repository: one with only the overscan
check, and one (that I use) which also adds overclocking if there is no overscan.
Please note that this uses the maximum stable overclocking reported in Magpi's
article on [overclocking the Raspberry Pi 4](https://magpi.rapsberrypi.org/articles/how-to-overclock-raspberry-pi-4).
If you wish to use it, make sure you have proper cooling and a good-quality
power source. I use the official Raspberry Pi power cord and an ICE Tower
kit from GeeekPi on Amazon (I know, crucify me later). Corsair has a quality
passive cooling case, as do others. Check some comparisons of different options
to pick what works best for you. Just *do not* overclock without *some* cooling.
I am not liable for anything you do to your Pi; I'm just here to facilitate it.
