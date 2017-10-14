#!/usr/bin/env bats

load test_helper

@test "invoking compress without arguments prints usage" {
    run compress.sh
    [ "$status" -eq 1 ]
    [ "${lines[0]}" = "usage: compress <tar_filename> <dir_to_compress>" ]
}
