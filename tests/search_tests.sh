#!/bin/bash
DATE=$(date +%d-%m-%Y_%H:%M:%S)
robot -d ../results --output output_search_tests_${DATE}.xml --log log_search_tests_${DATE}.html --report report_search_tests_${DATE}.html search_tests.robot
