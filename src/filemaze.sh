#!/bin/bash

default_depth=16
max_depth=30

main() {
    if [ -z "$1" ]; then
        echo "missing command"
        exit 1
    fi

    case $1 in
    init)
        init "$@"
        ;;
    *)
        echo "unknown command: $1"
        exit 1
        ;;
    esac

    echo "depth: $depth"
}

init() {
    shift
    while [ $# -gt 0 ]; do
        case $1 in
        -d | --depth)
            if ! is_valid_depth "$2"; then
                exit 1
            fi
            shift
            shift
            ;;
        *)
            echo "unknown option: $1"
            exit 1
            ;;
        esac
    done
    depth=${depth:-$default_depth}
}

is_valid_depth() {
    if [[ ! $1 =~ ^[1-9]+[0-9]*$ ]]; then
        echo "invalid depth: $1 (not positive integer)"
        false
        return
    fi
    depth=$(($1))
    if [ $depth -gt $max_depth ]; then
        echo "invalid depth: $1 (max depth: $max_depth)"
        false
        return
    fi
}

main "$@"
