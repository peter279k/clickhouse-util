#!/bin/bash

. ./load_colors.sh

echo -e $green_color"Creating Database is started!"$rest_color

arg=$1
auth_file_path=$2

if [[ $arg == "--help" ]]; then
    echo -e $yellow_color"Usage: ./create_database.sh database_name [auth_file_path]"$rest_color
    exit 0;
fi;

if [[ $auth_file_path == "" ]]; then
    auth_file_path="./auth.txt"
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

clickhouse-client --host=$ip_address --port=$port_number --password=$password --query="CREATE DATABASE IF NOT EXISTS $db_name"

if [[ $? != 0 ]]; then
    exit 1;
fi;

echo -e $green_color"Creating $db_name Database hsa been done!"$rest_color
