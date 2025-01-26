#!/bin/bash
DATE=$(date +%d-%m-%Y_%H:%M:%S)
robot -d ../results --output output_login_tests_${DATE}.xml --log log_login_tests_${DATE}.html --report report_login_tests_${DATE}.html login_tests.robot
