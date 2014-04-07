#!/usr/bin/env bats

load test_helper

@test "Running just totally with no commands should display usage" {
	run $TOTALLY
 	[ "$status" -eq 1 ]
  	echo "$output" | grep '^usage:'
}