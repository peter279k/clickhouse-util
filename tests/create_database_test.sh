#!/bin/bash
# file: examples/create_database_test.sh

test_create_database() {
    cd ..
    ./create_database.sh iotdevice ./tests/fixtures/auth.txt
    assertSame "iotdevice" "$(clickhouse-client --query='show databases' | grep 'iotdevice')"
}

# Load shUnit2.
. ./shunit2/shunit2
