#!/bin/bash

DIR=$(dirname "${BASH_SOURCE[0]}")
. "$DIR/share/variables.sh"

main() {
    if [ -z "$1" ]; then
        echo "missing command"
        exit 1
    fi

    case $1 in
    init)
        shift
        init "$@"
        ;;
    *)
        echo "unknown command: $1"
        exit 1
        ;;
    esac

    echo "depth: $DEPTH"
}

main "$@"
