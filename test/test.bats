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

@test "unknown command" {
    run filemaze.sh abc
    assert_failure
    assert_output "unknown command: abc"
}

@test "validate_depth" {
    . "$SRC_DIR/init.sh"

    for depth in "${VALID_DEPTHS[@]}"; do
        run validate_depth $depth
        assert_success
    done

    for depth in "${!INVALID_DEPTH_CASES[@]}"; do
        run validate_depth $depth
        assert_failure
        assert_output "${INVALID_DEPTH_CASESS[$depth]}"
    done
}
