#!/bin/bash

DIR=$(dirname "${BASH_SOURCE[0]}")
. "$DIR/variables.sh"

init() {
    while [ $# -gt 0 ]; do
        case $1 in
        -d | --depth)
            validate_depth "$2"
            DEPTH=$2
            shift 2
            ;;
        *)
            echo "unknown option: $1"
            exit 1
            ;;
        esac
    done
    DEPTH=${DEPTH:-DEFAULT_DEPTH}
}

validate_depth() {
    if [[ ! $1 =~ ^[1-9]+[0-9]*$ ]]; then
        echo "invalid depth: $1 (not positive integer)"
        exit 1
    fi
    if [ $(($1)) -gt $MAX_DEPTH ]; then
        echo "invalid depth: $1 (max depth: $MAX_DEPTH)"
        exit 1
    fi
}
