#!/bin/sh

systemdDir="/lib/systemd/system"
binDir="/bin"
script="check-overscan"
service="check-overscan.service"

if [ "$1" = "-u" ] || [ "$1" = "--uninstall" ]; then
    printf "Uninstalling $service... ";
    systemctl disable $service;
    rm $systemdDir/$service;
    systemctl daemon-reload;
    printf "Done.\n";

    printf "Uninstalling $script... ";
    rm $binDir/$script;
    printf "Done.\n";
else
    printf "Installing $script... ";
    cp $script $binDir/;
    chmod +x $binDir/$script;
    printf "Done.\n";

    printf "Installing $service... ";
    cp $service $systemdDir/;
    systemctl daemon-reload;
    systemctl enable $service;
    printf "Done.\n";
fi;
