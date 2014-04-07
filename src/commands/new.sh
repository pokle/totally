
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
