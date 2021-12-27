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

if [[ $ip_address == "" ]]; then
    echo "Please specify IP address"
    exit 1;
fi;

if [[ $port_number == "" ]]; then
    echo "Please specify port number"
    exit 1;
fi;

echo $ip_address
echo $port_number

if [[ $password == "" ]]; then
    clickhouse-client --host=$ip_address --port=$port_number --query="CREATE DATABASE IF NOT EXISTS $db_name"
else
    clickhouse-client --host=$ip_address --port=$port_number --password=$password --query="CREATE DATABASE IF NOT EXISTS $db_name"
fi;

if [[ $? != 0 ]]; then
    exit 1;
fi;

echo -e $green_color"Creating $db_name Database has been done!"$rest_color
