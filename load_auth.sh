#!/bin/bash

. ./load_colors.sh

echo -e $yellow_color"Load database auth file..."$rest_color

echo $auth_file_path

ip_address=$(cat $auth_file_path | grep "^ip_address" | awk '{split($1,a,"="); print a[2]}')
port_number=$(cat $auth_file_path | grep "^port_number" | awk '{split($1,a,"="); print a[2]}')
password=$(cat $auth_file_path | grep "^password" | awk '{split($1,a,"="); print a[2]}')
db_name=$(cat $auth_file_path | grep "^db_name" | awk '{split($1,a,"="); print a[2]}')

if [[ $db_name == "" ]]; then
    echo -e $yellow_color"The database name is not set on specific auth file!"$rest_color
    exit 1;
fi;
