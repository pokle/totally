TOTALLY=$BATS_TEST_DIRNAME/../totally

function create_test_home() {
	HOME="$BATS_TMPDIR/home"
	mkdir -p "$HOME"
	echo DOCKER_SSH_HOST=fake-home >$HOME/.totally
}

function create_test_project() {
	DIR=$BATS_TMPDIR/$1
	rm -rf $DIR; mkdir -p $DIR; cd $DIR
	$TOTALLY init
}
