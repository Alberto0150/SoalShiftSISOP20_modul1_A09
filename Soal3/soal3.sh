#!/bin/bash
for i in $(seq 28); do
	wget -a "wget.log" "https://loremflickr.com/320/240/cat" -O "/home/adam/SISOP/pdkt_kusuma_$i"
done

5 6-23/8 * * 1-5,7 /home/adam/SISOP/soal3.sh


