#!/bin/bash

. ./load_colors.sh

echo -e $green_color"Importing data is started..."$rest_color

table_name=$1
data_file=$2
data_format=$3
auth_file_path=$4

if [[ $table_name == "" ]]; then
    echo -e $red_color"Please specify table query file!"$rest_color
    exit 1;
fi;

if [[ $table_name == "--help" ]]; then
    echo -e $yellow_color"Usage: ./import_data.sh table_name data_file data_format [auth_file_path]"$rest_color
    exit 0;
fi;

if [[ $data_file == "" ]]; then
    echo -e $red_color"Please specify data file name!"$rest_color
    exit 1; 
fi;

if [[ ! -f $data_file ]]; then
    echo -e $red_color"The specific data file is not found!"$rest_color
    exit 1; 
fi;

if [[ $data_format == "" ]]; then
    echo -e $red_color"Please specify data file format!"$rest_color
    exit 1; 
fi;

. ./basic_checker.sh $auth_file_path

if [[ $? != 0 ]]; then
    exit 1;
fi;

. ./load_auth.sh $auth_file_path

if [[ $password == "" ]]; then
    clickhouse-client --host=$ip_address --port=$port_number --database=$db_name --query="INSERT INTO $db_name.$table_name FORMAT $data_format" --max_insert_block_size=100000 < $data_file
else
    clickhouse-client --host=$ip_address --port=$port_number --password=$password --database=$db_name --query="INSERT INTO $db_name.$table_name FORMAT $data_format" --max_insert_block_size=100000 < $data_file
fi;


if [[ $? != 0 ]]; then
    echo -e $red_color"Importing data is failed!"$rest_color
fi;

echo -e $green_color"Importing data is done!"$rest_color
