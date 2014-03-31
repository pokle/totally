#!/usr/bin/env bats

load test_helper

@test "LOCAL_ROOT should be overriden" {
	skip
}

@test "Configuration from the project root should override config from the home directory" {

	create_test_home	
	echo DOCKER_SSH_HOST=host-from-home >$HOME/.totally

	create_test_project a-project
	echo DOCKER_SSH_HOST=host-from-a-project >> .totally
	
	run $TOTALLY config

	[ "$status" -eq 0 ]
	echo "$output" | grep DOCKER_SSH_HOST=host-from-a-project 
}