
function cmd_init() {
    [ -f .totally ] && die "This directory has already been initialised. 'cat .totally' to see your project."

    local BUILD_DIR=$(find . -name Dockerfile | head -1 | xargs dirname)

    if [ -z "$BUILD_DIR" ]; then
        BUILD_DIR=.
        log "Creating a quick start Dockerfile - please edit"
        cat >Dockerfile <<-HERE
			FROM tianon/centos:6.5
			ADD . /app
			WORKDIR /app
			EXPOSE 8000
			CMD python -m SimpleHTTPServer 8000
		HERE
    fi

    local name=$(basename $PWD)
    cat > .totally <<-HERE
		NAME="$name"
		BUILD_DIR="$BUILD_DIR"
		IMAGE="\$NAME:latest"
		CONTAINER="\$USER-\$NAME"
		TUNNEL_PORT=12000
	HERE

    echo Initialised new Totally project called $name
    exit 0
}

# Override this function if you like in your ~/.totally
function instantiate_template() {
    TEMPLATE=$1
    NAME=$2
    shift; shift;
    REST=$@

    # Fetch templates from github.com
    if [ -d ~/.totally-templates/$TEMPLATE ]; then
        if [ -d ~/.totally-templates/$TEMPLATE/.git ]; then
            (cd ~/.totally-templates/$TEMPLATE && 
                echo -n 'Updating template... ' &&
                git pull)
        else
            echo Using local template
        fi
    else
        mkdir -p ~/.totally-templates/$TEMPLATE
        rmdir    ~/.totally-templates/$TEMPLATE # remove just the deepest dir
        git clone https://github.com/$TEMPLATE ~/.totally-templates/$TEMPLATE
    fi

    echo -- Instantiating template $TEMPLATE into $NAME
    ~/.totally-templates/$TEMPLATE/instantiate $NAME $REST
}

function cmd_new() {
    TEMPLATE=$1
    NAME=$2

    [ -z "$TEMPLATE" -o -z "$NAME" ] && die "usage: totally new TEMPLATE NAME"

    instantiate_template $@

    exit 0 # We consumed arguments
}
