#!/bin/bash

. ./load_colors.sh

echo -e $green_color"Exporting data is started..."$rest_color

table_name=$1
data_format=$2
outfile_path=$3
auth_file_path=$4

if [[ $table_name == "" ]]; then
    echo -e $red_color"Please specify table query file!"$rest_color
    exit 1;
fi;

if [[ $table_name == "--help" ]]; then
    echo -e $yellow_color"Usage: ./export_data.sh table_name data_format outfile_path [auth_file_path]"$rest_color
    exit 0;
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
    clickhouse-client --host=$ip_address --port=$port_number --database=$db_name --query="SELECT * from $table_name" --format $data_format > $outfile_path
else
    clickhouse-client --host=$ip_address --port=$port_number --password=$password --database=$db_name --query="SELECT * from $table_name" --format $data_format > $outfile_path
fi;

if [[ $? != 0 ]]; then
    echo -e $red_color"Exporting data is failed!"$rest_color
fi;

echo -e $green_color"Exporting data is done!"$rest_color
