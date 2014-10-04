#!/bin/bash
if [ -f "scores.txt" ]; then
    rm scores.txt
else
    touch scores.txt
fi
for repno in {1..5}
do
    if [ -d "$repno" ]; then  
	rm -rf $repno/src/tests/threads/*
#	cp ../pintos/src/tests/threads/. $repno/src/tests/threads/ -R
	cp tests/. $repno/src/tests/threads/ -R
	cd $repno/src/threads
	make clean > log.txt
	make >> log.txt
	if [ -d "build" ]; then
	    make check >> log.txt
	    echo "Details for repo $repno" >> ~/Documents/Submissions/scores.txt
	    grep "tests " log.txt >> ~/Documents/Submissions/scores.txt
	else
	    echo "Compile failed for directory: $repno" >> log.txt
	fi
	echo "Finished grading: $repno"
	cd ../../../
    else 
	echo "Directory not found: $repno">> log.txt
    fi
done