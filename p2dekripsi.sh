#!/bin/bash

#dekripsi

for loop in $(seq 25); do
	if [ $loop -eq $jam ]
	  then
	   bisa=`echo $filename | tr $(printf %${I}s | tr ' ' '.')\N-ZA-Mn-za-m A-Za-z`
	fi
done

echo $random > $bisa.txt
