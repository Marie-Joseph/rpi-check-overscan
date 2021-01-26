#!/bin/sh

script="/bin/check-overscan.sh"
service="check-overscan.service"
systemdDir="/lib/systemd/system"

systemctl disable $service
rm $script $systemdDir/$service
systemctl daemon-reload
