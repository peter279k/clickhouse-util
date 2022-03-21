#!/bin/bash

db_name="$1"
db_name=$(echo "$db_name" | grep -oP "[A-Z,a-z,0-9,_]")
db_name=$(echo "$db_name" | tr -d [[:space:]])

echo $db_name
