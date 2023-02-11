#!/bin/bash

# Create four directories: dir1, dir2, dir3, dir4
mkdir dir1 dir2 dir3 dir4

# Put the names of the four directories in an array
directories=(dir1 dir2 dir3 dir4)

# Reference the array variable to create a new .txt file in each directory
for dir in ${directories[@]}
do
    touch $dir/file.txt
done