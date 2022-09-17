#!/bin/bash

SRC_DIR=$(dirname "${BASH_SOURCE[0]}")
. "$SRC_DIR/share/variables.sh"

init() {
    while [ $# -gt 1 ]; do
        case $1 in
        -d | --depth)
            get_depth "$2"
            shift 2
            ;;
        -p | --parents)
            PARENTS=true
            shift 1
            ;;
        *)
            echo "invalid option: $1"
            exit 1
            ;;
        esac
    done

    if [ $# -eq 1 ]; then
        get_maze_dir "$1"
    fi
}

get_depth() {
    if [[ ! $1 =~ ^[1-9]+[0-9]*$ ]]; then
        echo "invalid depth: $1 (not positive integer)"
        exit 1
    fi
    if [ $(($1)) -gt $MAX_DEPTH ]; then
        echo "invalid depth: $1 (max depth: $MAX_DEPTH)"
        exit 1
    fi
    DEPTH=$1
}

get_maze_dir() {
    if [[ $PARENTS = false && ! -d "$1" ]]; then
        echo "invalid directory: $1 (does not exist)"
        exit 1
    fi
    MAZE_DIR=$1
}
