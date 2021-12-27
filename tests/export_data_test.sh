#!/bin/bash
# file: examples/export_data_test.sh

test_export_data() {
    cd ..
    ./export_data.sh iotdevice01 CSV ./tests/fixtures/export_test_result.csv ./tests/fixtures/auth.txt
    assertTrue "[ -f ./tests/fixtures/export_test_result.csv ]"
    assertSame '53.06,1000,2.6,0,11,"2021-12-23 05:06:02"' "$(cat ./tests/fixtures/export_test_result.csv)"
}

# Load shUnit2.
. ./shunit2/shunit2
