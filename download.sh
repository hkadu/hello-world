#!/bin/bash
#for repno in {1..76}
do
    if [ -d "$repno" ]; then
	rm -rf $repno
    fi
	
    if git ls-remote git@github.com:USC-CS350-2014/$repno.git | grep -sw Project-1 2>&1>/dev/null; then  
	git clone -b Project-1 git@github.com:USC-CS350-2014/$repno.git 
    else 
	echo "Branch not found for $repno" 
    fi
done