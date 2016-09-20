#!/bin/bash

find ~/code/linda/dict/ -type f -exec cat {} \; > ~/code/linda/tmp.txt

cat $1 | egrep -v -f ~/code/linda/tmp.txt

rm ~/code/linda/tmp.txt
