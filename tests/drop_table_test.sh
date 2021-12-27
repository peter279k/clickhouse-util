#!/bin/bash
# file: examples/drop_table_test.sh

test_drop_table() {
    cd ..
    ./drop_table.sh iotdevice01 ./tests/fixtures/auth.txt
    assertSame "" "$(clickhouse-client --database=iotdevice --query='show tables' | grep 'iotdevice01')"
}

# Load shUnit2.
. ./shunit2/shunit2
