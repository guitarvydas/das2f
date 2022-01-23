#!/bin/bash
# this is only an example
# use das2f.bash instead
clear
# build needs to run once to create query .bash scripts
./build.bash .. ## this line can be removed after development
./das2f.bash .. helloworld.drawio
