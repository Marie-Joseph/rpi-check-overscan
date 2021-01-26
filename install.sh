#!/bin/sh

systemdDir="/lib/systemd/system"
binDir="/bin"
script="check-overscan.sh"
service="check-overscan.service"

chmod +x $script
systemctl daemon-reload
cp $script $binDir/
cp $service $systemdDir/
systemctl enable $service
