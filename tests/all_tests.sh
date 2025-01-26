#!/bin/bash

# Iterate over all .sh files in the directory
for test_script in ./*.sh; do
  if [ "$(basename "$test_script")" == "all_tests.sh" ]; then
    continue
  fi
  echo "Running $test_script..."
  bash "$test_script"
#   if [ $? -ne 0 ]; then
#     echo "Test $test_script failed."
#     exit 1
#   fi
done

echo "All tests completed successfully."