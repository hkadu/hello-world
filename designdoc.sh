#!/bin/bash
if [ -f "design.txt" ]; then
    rm design.txt
else
    touch design.txt
fi
for repno in {1..76}
do
    if [ -d "$repno" ]; then
	echo "Details for repo $repno" >> design.txt
	find $repno/. -iname "design*" >> design.txt
    else 
	echo "Directory not found: $repno"
    fi
done