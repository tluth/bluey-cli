# ./test/bluey_test.sh
#!/usr/bin/env bats

load test_helper

setup() {
  rm -rf testing && mkdir testing
  cd testing
}

teardown() {
  cd ..
  rm -rf testing
}

@test "it executes new command" {
  run $BLUEY [ "$status" -eq 1 ]
  [ "${lines[0]}" = "Error: A device name must be given." ]
}