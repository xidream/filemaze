#!/bin/bash

SRC_DIR=$(dirname "${BASH_SOURCE[0]}")
. "$SRC_DIR/init.sh"

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
        echo "invalid command: $1"
        exit 1
        ;;
    esac
}

main "$@"
