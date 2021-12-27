#!/bin/bash

. ./load_colors.sh

arg=$1

if [[ $arg == "" ]]; then
    echo -e $yellow_color"Warning! auth file path will set ./auth.txt"$rest_color
    arg="./auth.txt"
fi;

if [[ ! -f $arg ]]; then
    echo -e $red_color"auth.txt file is not found! Please check this file firstly!"$rest_color
    exit 1;
fi;

which clickhouse-client 2>&1 > /dev/null

if [[ $? != 0 ]]; then
    echo -e $red_color"clickhouse-client command not found. Please install it firstly!"$rest_color
    exit 1;
fi;
