#!/bin/bash

# separator between labels and values, might be helpful to import data into csv/excel
separator=";"

# example: actual_test 'python main.py' 'python1.txt' 3
function actual_test()
{
    command=$1 # command thar should be executed during the test
    file=$2 # the file to save results
    repetitions=$3 # how many times the test should run and append the result to result file

    echo $command
    echo $file
    echo $repetitions

    # file format:
    format="%e$separator"           # real elapsed time (in seconds)
    echo -n "real time (s)$separator" > $file

    format=$format"%U$separator"    # user time         (in seconds)
    echo -n "user time (s)$separator" >> $file

    format=$format"%S$separator"    # system time       (in seconds)
    echo -n "system time (s)$separator" >> $file

    format=$format"%P$separator"    # CPU usage         ((%U + %S) / %E)
    echo -n "CPU usage (%)$separator" >> $file

    format=$format"%M$separator"    # Maximum resident set size of the process during its lifetime, in Kbytes.
    echo -n "maximum resident set size of the process during lifetime (Kbytes)$separator" >> $file

    format=$format"%c$separator"    # Number of times the process was context-switched involuntarily (because the time slice expired)
    echo -n "number of involuntarily context-switches$separator" >> $file

    format=$format"%w$separator"    # Number of waits: times that the program was context-switched voluntarily, for instance while waiting for an I/O operation to complete  
    echo -n "number of voluntarily context-switches$separator" >> $file

    format=$format"%x$separator"    # exit status (other than 0 is an error)
    echo -n "status code$separator" >> $file

    echo '' >> $file
    wait

    for (( i=0; i<$repetitions; i++ ))
    do
        /usr/bin/time -f $format $command 2>> $file
        wait
    done
}

function python_tests()
{
    number_of_ints=10
    number_of_files=100
    directory_with_files=~/Thesis/Ints/
    sorting_on=true

    command="python python/main.py $number_of_ints $number_of_files $directory_with_files $sorting_on"
    file="results/pythonResult.txt"
    repetitions=1

    actual_test "$command" $file $repetitions
}

python_tests