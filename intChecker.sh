#! /bin/bash

echo $1 | grep -P "^[0-9]+$" > /dev/null 2>&1
test $? -eq "0" && echo "Integer" || echo "Unkonwn type"
