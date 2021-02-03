#!/bin/sh

systemdDir="/lib/systemd/system"
binDir="/bin"
script="check-overscan"
service="check-overscan.service"

sh_cp() {
    while IFS= read -r line || [ -n "$line" ]; do
        printf "$line\n" >> $2;
    done < $1;
}

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
    sh_cp $script $binDir/$script;
    chmod +x $binDir/$script;
    printf "Done.\n";

    printf "Installing $service... ";
    sh_cp $service $systemdDir/$service;
    systemctl daemon-reload;
    systemctl enable $service;
    printf "Done.\n";
fi;
