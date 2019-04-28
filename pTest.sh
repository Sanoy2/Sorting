#!/bin/bash

number_of_ints=10
number_of_files=100
directory_with_files=/home/krzysztof/Thesis/Ints/
sorting_on=true

command="python python/main.py $number_of_ints $number_of_files $directory_with_files $sorting_on"
file="pythonResult.txt"
repetitions=1

./runTest.sh $command $file $repetitions