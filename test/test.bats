setup() {
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
    load 'test_helper/bats-file/load'

    load 'test_helper/test-cases'

    TEST_DIR="$(cd "$(dirname "$BATS_TEST_FILENAME")" >/dev/null 2>&1 && pwd)"
    SRC_DIR="$TEST_DIR/../src"

    PATH="$SRC_DIR:$PATH"
}

@test "missing command" {
    run filemaze.sh
    assert_failure
    assert_output "missing command"
}

@test "invalid command" {
    run filemaze.sh abc
    assert_failure
    assert_output "invalid command: abc"
}

@test "get_depth()" {
    . init.sh

    for depth in "${VALID_DEPTHS[@]}"; do
        run get_depth $depth
        assert_success
    done

    for depth in "${!INVALID_DEPTH_CASES[@]}"; do
        run get_depth $depth
        assert_failure
        assert_output "${INVALID_DEPTH_CASESS[$depth]}"
    done
}

@test "get_maze_dir()" {
    . init.sh

    local test_dir="path/does/not/exist"

    PARENTS=true
    run get_maze_dir $test_dir
    assert_success

    PARENTS=false
    run get_maze_dir $test_dir
    assert_failure
    assert_output "invalid directory: path/does/not/exist (does not exist)"

    mkdir -p $test_dir

    PARENTS=true
    run get_maze_dir $test_dir
    assert_success

    PARENTS=false
    run get_maze_dir $test_dir
    assert_success

    rmdir -p $test_dir
}
