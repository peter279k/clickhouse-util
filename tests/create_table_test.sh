#!/bin/bash
# file: examples/create_table_test.sh

test_create_table() {
    cd ..
    ./create_table.sh ./tests/fixtures/query.sql ./tests/fixtures/auth.txt
    assertSame 0 $(clickhouse-client --database=iotdevice --query="show tables" | grep 'iotdevice01')
}

# Load shUnit2.
. ./shunit2/shunit2
