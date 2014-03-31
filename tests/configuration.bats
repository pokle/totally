#!/usr/bin/env bats

TOTALLY=$BATS_TEST_DIRNAME/../totally

function create_test_home() {
	HOME="$BATS_TMPDIR/home"
	mkdir -p "$HOME"
	echo DOCKER_SSH_HOST=fake-home >$HOME/.totally
}

function create_test_project() {
	DIR=$1
	rm -rf $DIR; mkdir -p $DIR; cd $DIR
	$TOTALLY init
}

@test "LOCAL_ROOT should be overriden" {
	skip
}

@test "Configuration from the project root should override config from the home directory" {

	create_test_home	
	echo DOCKER_SSH_HOST=host-from-home >$HOME/.totally

	create_test_project "$BATS_TMPDIR/project"
	echo DOCKER_SSH_HOST=host-from-project >> .totally
	
	run $TOTALLY config

	[ "$status" -eq 0 ]
	echo "$output" | grep DOCKER_SSH_HOST=host-from-project 
}