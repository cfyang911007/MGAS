#!/bin/bash

declare -a names=(
    FRR1
    FRR2
)
for i in ${names[@]};do
	p="/rawdata" #path to rawdata
	R1=$i"_1.fq.gz"
	R2=$i"_2.fq.gz"
	PREFIX=$i
    fastp -i $p/$R1 -o $PREFIX.clean.1.fq.gz -I $p/$R2 -O $PREFIX.clean.2.fq.gz -q 20 -u 10 -w 16
done

