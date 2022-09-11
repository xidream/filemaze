setup() {
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
    load 'test_helper/bats-file/load'

    load 'test_helper/outputs'

    DIR="$(cd "$(dirname "$BATS_TEST_FILENAME")" >/dev/null 2>&1 && pwd)"
    PATH="$DIR/../src:$PATH"
}

@test "missing command" {
    run filemaze.sh
    assert_output "$(missing_command)"
}

@test "unknown command" {
    run filemaze.sh abc
    assert_output "$(unknown_command abc)"
}

@test "init" {
    run filemaze.sh init
    assert_success
    assert_output "$(valid_depth 16)"

    run filemaze.sh init -d 10
    assert_success
    assert_output "$(valid_depth 10)"

    run filemaze.sh init -d 30
    assert_success
    assert_output "$(valid_depth 30)"

    run filemaze.sh init -d 0
    assert_failure
    assert_output "$(not_positive_number 0)"

    run filemaze.sh init -d -1
    assert_failure
    assert_output "$(not_positive_number -1)"

    run filemaze.sh init -d ?
    assert_failure
    assert_output "$(not_positive_number ?)"

    run filemaze.sh init -d 31
    assert_failure
    assert_output "$(max_depth 31)"

    run filemaze.sh init abc
    assert_failure
    assert_output "$(unknown_option abc)"
}
