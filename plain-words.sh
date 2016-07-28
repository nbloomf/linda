#!/bin/bash

cat $1 | \
  tr "A-Z" "a-z" | \
  tr -c -s "a-z" "\n" | \
  sort -d | uniq
