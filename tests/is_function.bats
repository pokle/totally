#!/usr/bin/env bats

load test_helper

@test "real function" {
	function foo_abc() { :; }
	
	run is_function foo_abc
 	[ "$status" -eq 0 ]
}

@test "non-existant function" {
	run is_function no_this_function_does_not_exist_really
 	[ "$status" -eq 1 ]
}