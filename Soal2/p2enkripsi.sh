#!/bin/bash
for loop in $(seq 25); do
	if [ $loop -eq $jam ]
	  then
	  bisa=`echo $filename | tr $(printf %${loop}s | tr ' ' '.')\A-Za-z N-ZA-Mn-za-m`
	fi
done
echo $random > $bisa.txt
