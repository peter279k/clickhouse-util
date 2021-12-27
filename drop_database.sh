#!/bin/bash

. ./load_colors.sh

echo -e $green_color"Drop Database is started!"$rest_color

arg=$1
auth_file_path=$2

if [[ $arg == "--help" ]]; then
    echo -e $yellow_color"Usage: ./drop_database.sh database_name [auth_file_path]"$rest_color
    exit 0;
fi;

./basic_checker.sh $auth_file_path

if [[ $? != 0 ]]; then
    exit 1;
fi;

. ./load_auth.sh $auth_file_path

if [[ $? != 0 ]]; then
    exit 1;
fi;

if [[ $db_name == "" ]]; then
    db_name=$arg
fi;

if [[ $password == "" ]]; then
    clickhouse-client --host=$ip_address --port=$port_number --query="DROP DATABASE IF EXISTS $db_name"
else
    clickhouse-client --host=$ip_address --port=$port_number --password=$password --query="DROP DATABASE IF EXISTS $db_name"
fi;

if [[ $? != 0 ]]; then
    exit 1;
fi;

echo -e $green_color"Dropping $db_name Database hsa been done!"$rest_color
