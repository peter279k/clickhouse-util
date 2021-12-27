#!/bin/bash
# file: examples/drop_database_test.sh

test_drop_database() {
    cd ..
    ./drop_database.sh iotdevice ./tests/fixtures/auth.txt
    assertNotSame 0 "$(clickhouse-client --query='show databases' | grep 'iotdevice')"
}

# Load shUnit2.
. ./shunit2/shunit2
