#!/usr/bin/env bats

@test "Running just totally with no commands should display usage" {
	run $BATS_TEST_DIRNAME/../totally
 	[ "$status" -eq 1 ]
  	echo "$output" | grep '^usage:'
}