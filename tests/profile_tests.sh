#!/bin/bash
DATE=$(date +%d-%m-%Y_%H:%M:%S)
robot -d ../results --output output_profile_tests_${DATE}.xml --log log_profile_tests_${DATE}.html --report report_profile_tests_${DATE}.html profile_tests.robot
