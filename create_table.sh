#!/bin/bash

. ./load_colors.sh

echo -e $green_color"Creating table is started..."$rest_color

table_query_file=$1
auth_file_path=$2

if [[ $table_query_file == "" ]]; then
    echo -e $red_color"Please specify table query file!"$rest_color
    exit 1;
fi;

if [[ $table_query_file == "--help" ]]; then
    echo -e $yellow_color"Usage: ./create_table.sh table_query_file [auth_file_path]"$rest_color
    exit 0;
fi;

if [[ $auth_file_path == "" ]]; then
    auth_file_path="./auth.txt"
fi;


. ./basic_checker.sh $auth_file_path

if [[ $? != 0 ]]; then
    exit 1;
fi;

. ./load_auth.sh $auth_file_path

cat $table_query_file | clickhouse-client --host=$ip_address --port=$port_number --password=$password --database=$db_name


if [[ $? != 0 ]]; then
    echo -e $red_color"Creating specific table is failed."$rest_color
    exit 1;
fi;

echo -e $green_color"Creating specific table is done."$rest_color
