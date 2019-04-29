#!/bin/bash

# separator between labels and values, might be helpful to import data into csv/excel
separator=";"

# example: actual_test 'python main.py' 'python1.txt' 3
function write_labels()
{
    resultFile=$1
    echo -n "numbers should be sorted$separator" >> $resultFile
    echo -n "number of int numbers$separator" > $resultFile
    echo -n "number of files$separator" >> $resultFile
    echo -n "real time (s)$separator" >> $resultFile
    echo -n "user time (s)$separator" >> $resultFile
    echo -n "system time (s)$separator" >> $resultFile
    echo -n "CPU usage (%)$separator" >> $resultFile
    echo -n "maximum resident set size of the process during lifetime (Kbytes)$separator" >> $resultFile
    echo -n "number of involuntarily context-switches$separator" >> $resultFile
    echo -n "number of voluntarily context-switches$separator" >> $resultFile
    echo -n "status code$separator" >> $resultFile
}

function perform_test()
{
    # general arguments - the same for all tested programs
    command=$1          # command thar should be executed during the test
    resultFile=$2       # the file to save results
    repetitions=$3      # how many times the test should run and append the result to result file

    # arguments typical for sorting machines
    numberOfInts=$4     # how many numbers to sort
    numberOfFiles=$5    # how many files were loaded (and sorted or not sorted)
    sortingOn=$6        # shows if sorting was performed or not

    echo $command
    echo $resultFile
    echo $repetitions

    # file format:
    format="%e$separator"           # real elapsed time (in seconds)
    format=$format"%U$separator"    # user time         (in seconds)
    format=$format"%S$separator"    # system time       (in seconds)
    format=$format"%P$separator"    # CPU usage         ((%U + %S) / %E)
    format=$format"%M$separator"    # Maximum resident set size of the process during its lifetime, in Kbytes.
    format=$format"%c$separator"    # Number of times the process was context-switched involuntarily (because the time slice expired)
    format=$format"%w$separator"    # Number of waits: times that the program was context-switched voluntarily, for instance while waiting for an I/O operation to complete  
    format=$format"%x$separator"    # exit status (other than 0 is an error)

    echo '' >> $resultFile
    wait

    for (( i=0; i<$repetitions; i++ ))
    do
        echo -n "$sortingOn$separator" >> $resultFile
        echo -n "$numberOfInts$separator" >> $resultFile
        echo -n "$numberOfFiles$separator" >> $resultFile
        wait
        /usr/bin/time -f $format $command 2>> $resultFile
        wait
    done
}

function python_tests()
{
    # number_of_ints=10 # obsolete; now the script is looking for all the directories with data
    number_of_files=100
    directory_with_files=~/Thesis/Ints/
    sorting_on=true


    command="python python/main.py $number_of_ints $number_of_files $directory_with_files $sorting_on"
    resultFile="results/pythonResult.txt"
    repetitions=10

    for pack in `find $directory_with_files -type d` ;
    do
        number_of_ints=$(basename "${pack}")
        echo $number_of_ints
    done


    # write_labels $resultFile
    # perform_test "$command" $resultFile $repetitions $number_of_ints $number_of_files $sorting_on
}

python_tests