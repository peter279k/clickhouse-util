#!/bin/bash

echo "Run tests has been started!"
echo ""

./create_database_test.sh
sleep 2

./create_table_test.sh
sleep 2

./import_data_test.sh
sleep 2

./export_data_test.sh
sleep 2

./drop_table_test.sh
sleep 2

./drop_database_test.sh
sleep 2

echo "Run tests has been done!"
