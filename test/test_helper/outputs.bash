missing_command() {
    echo "missing command"
}

unknown_command() {
    echo "unknown command: $1"
}

unknown_option() {
    echo "unknown option: $1"
}

valid_depth() {
    echo "depth: $1"
}

not_positive_number() {
    echo "invalid depth: $1 (not positive integer)"
}

max_depth() {
    echo "invalid depth: $1 (max depth: 30)"
}
