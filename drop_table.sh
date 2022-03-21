#!/bin/bash

. ./load_colors.sh

echo -e $green_color"Dropping table is started..."$rest_color

table_name=$1
auth_file_path=$2

if [[ $table_name == "" ]]; then
    echo -e $red_color"Please specify table name!"$rest_color
    exit 1;
fi;

if [[ $table_name == "--help" ]]; then
    echo -e $yellow_color"Usage: ./drop_table.sh table_name [auth_file_path]"$rest_color
    exit 0;
fi;

. ./basic_checker.sh $auth_file_path

if [[ $? != 0 ]]; then
    exit 1;
fi;

. ./load_auth.sh $auth_file_path

db_name=$(./regex_filter.sh $db_name)

if [[ $password == "" ]]; then
    clickhouse-client --host=$ip_address --port=$port_number --database=$db_name --query="DROP TABLE IF EXISTS $table_name"
else
    clickhouse-client --host=$ip_address --port=$port_number --password="$password" --database=$db_name --query="DROP TABLE IF EXISTS $table_name"
fi;


if [[ $? != 0 ]]; then
    echo -e $red_color"Dropping specific table is failed."$rest_color
    exit 1;
fi;

echo -e $green_color"Dropping specific table is done."$rest_color
