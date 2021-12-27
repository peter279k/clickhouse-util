#!/bin/bash

. ./load_colors.sh

echo -e $green_color"Welcome to the ClickHouse Installer!"$rest_color
echo -e $yellow_color"This Bash script is only available for Ubuntu 18.04 and 20.04 now!"$rest_color

if [[ $USER != "root" ]]; then
    sudo_user="sudo"
fi;


$sudo_user apt-get install apt-transport-https ca-certificates dirmngr
$sudo_user apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv E0C56BD4
echo "deb https://repo.clickhouse.com/deb/stable/ main/" | sudo tee \
    /etc/apt/sources.list.d/clickhouse.list
$sudo_user apt-get update

$sudo_user apt-get install -y clickhouse-server clickhouse-client

echo "Installing ClickHouse DB has been done!"
echo "This machine will be reboot soon..."

$sudo_user systemctl reboot
