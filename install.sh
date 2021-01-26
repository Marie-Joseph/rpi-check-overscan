#!/bin/sh

systemdDir="/lib/systemd/system"
binDir="/bin"
script="check-overscan.sh"
service="check-overscan.service"

systemctl daemon-reload
echo -n "Installing $script... "
cp $script $binDir/
chmod +x $binDir/$script
echo "Done."

echo -n "Installing $service... "
cp $service $systemdDir/
systemctl enable $service
echo "Done."
