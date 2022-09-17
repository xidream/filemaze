
export VALID_DEPTHS=("1" "10" "30")

declare -A INVALID_DEPTH_CASES=(
    ["0"]="invalid depth: 0 (not positive integer)"
    ["-1"]="invalid depth: -1 (not positive integer)"
    ["31"]="invalid depth: 31 (max depth: 30)"
    ["abc"]="invalid depth: abc (not positive integer)"
)
export INVALID_DEPTH_CASES
