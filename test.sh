#!/bin/bash

# Simple test to ensure the output matches that of `tail`

diff -u <(cat /etc/passwd | ruby tail.rb 250) <(cat /etc/passwd | tail -n 250)

echo "This number should be 0: ${?}"
