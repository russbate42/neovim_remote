#!/bin/bash

## Right status line for tmux

free -m | awk '/Mem/{printf "%.2f%%", 100*$3/$2}'
printf " - "
free -m -h | awk '/Mem/{printf $3"/"$2}'

