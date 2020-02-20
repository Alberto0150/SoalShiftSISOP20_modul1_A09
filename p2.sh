#!/bin/bash
#generate password
berkas=$1 
filename="${berkas%.*}"
random=`<  /dev/urandom tr -dc A-Za-z0-9 | head -c28`
jam=`date "+%k"`;


#enkripsi

for loop in $(seq 25); do
 if [ $loop -eq $jam ]
  then
   bisa=`echo $filename  | tr $(printf %${loop}s | tr ' ' '.')\A-Za-z N-ZA-Mn-za-m`
 fi
done
echo $random > $bisa.txt

#dekripsi

for loop in $(seq 25); do
 if [ $loop -eq $jam]
  then
   bisa=`echo $filename | tr $(printf %${loop}s | tr ' ' '.')\N-ZA-Mn-za-m A-Za-z
 fi
done
echo $random > $bisa.txt
