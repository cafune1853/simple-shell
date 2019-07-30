#!/bin/bash
path="/tmp/$1.pdf"
man -t $1 | ps2pdf - "$path"
okular $path &


