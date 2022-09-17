#!/bin/bash

TEST_DIR=$(dirname "${BASH_SOURCE[0]}")

./"$TEST_DIR"/bats/bin/bats "$TEST_DIR/test.bats"
