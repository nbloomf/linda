#!/bin/bash

find ./dict -type f -exec cat {} + > tmp.txt

cat $1 | egrep -v -f ~/code/linda/tmp.txt

rm tmp.txt
