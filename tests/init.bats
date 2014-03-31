#!/usr/bin/env bats

load test_helper

@test "Init should create a project with the same name as the directory" {

	# implcitly runs init
	create_test_project "your-name-is-your-game"

	cat .totally

	run $TOTALLY config

	[ $status -eq 0 ]
	grep NAME=\"your-name-is-your-game\" .totally

}
