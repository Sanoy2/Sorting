#!/bin/bash

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
    format="%e\n"           # real elapsed time (in seconds)
    echo "real time (s)" > $file

    format=$format"%U\n"    # user time         (in seconds)
    echo "user time (s)" >> $file

    format=$format"%S\n"    # system time       (in seconds)
    echo "system time (s)" >> $file

    format=$format"%P\n"    # CPU usage         ((%U + %S) / %E)
    echo "CPU usage (%)" >> $file

    format=$format"%M\n"    # Maximum resident set size of the process during its lifetime, in Kbytes.
    echo "maximum resident set size of the process during lifetime (Kbytes)" >> $file

    format=$format"%c\n"    # Number of times the process was context-switched involuntarily (because the time slice expired)
    echo "number of involuntarily context-switches" >> $file

    format=$format"%w\n"    # Number of waits: times that the program was context-switched voluntarily, for instance while waiting for an I/O operation to complete  
    echo "number of voluntarily context-switches" >> $file

    format=$format"%x\n"    # exit status (other than 0 is an error)
    echo "status code" >> $file

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