#!/bin/sh

systemdDir="/lib/systemd/system"
binDir="/bin"
script="check-overscan"
service="check-overscan.service"

if [ $1 = "-u" ] || [ $1 = "--uninstall" ]; then
    echo -n "Uninstalling $service... ";
    systemctl disable $service;
    rm $systemdDir/$service;
    systemctl daemon-reload;
    echo "Done.";

    echo -n "Uninstalling $script... ";
    rm $binDir/$script;
    echo "Done.";
else
    echo -n "Installing $script... ";
    cp $script $binDir/;
    chmod +x $binDir/$script;
    echo "Done.";

    echo -n "Installing $service... ";
    cp $service $systemdDir/;
    systemctl daemon-reload;
    systemctl enable $service;
    echo "Done.";
fi;
