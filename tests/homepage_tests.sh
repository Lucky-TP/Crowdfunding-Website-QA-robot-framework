#!/bin/bash
DATE=$(date +%d-%m-%Y_%H:%M:%S)
robot -d ../results --output output_homepage_tests_${DATE}.xml --log log_homepage_tests_${DATE}.html --report report_homepage_tests_${DATE}.html homepage_tests.robot
