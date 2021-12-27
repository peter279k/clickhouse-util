#!/bin/bash
# file: examples/import_data_test.sh

test_import_data() {
    cd .. 
    ./import_data.sh iotdevice01 ./tests/fixtures/2021-12-23T05:06:02+00:00.csv CSV ./tests/fixtures/auth.txt
    query_result=$(clickhouse-client --query="select * from iotdevice.iotdevice01")
    assertSame 53.06 "$(echo $query_result | awk '{print $1}')"
    assertSame 1000 "$(echo $query_result | awk '{print $2}')"
    assertSame 2.6 "$(echo $query_result | awk '{print $3}')"
    assertSame 0 "$(echo $query_result | awk '{print $4}')"
    assertSame 11 "$(echo $query_result | awk '{print $5}')"
    assertSame '2021-12-23 05:06:02' "$(echo $query_result | awk '{print $6" "$7}')"
}

# Load shUnit2.
. ./shunit2/shunit2
