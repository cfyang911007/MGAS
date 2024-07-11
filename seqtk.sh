#!/bin/bash
#to trim the barcode with 6 bp in the reverse.fastq

IFS=$'\n'
for i in `cat $1` #the sample.list in 03.demux
do
  seqtk trimfq -b 6 ./fastq_multx_output-1/${i}.2.fastq > ./fastq_multx_trim_output-1/${i}.2.trim.fastq
  seqtk trimfq -b 6 ./fastq_multx_output-2/${i}.2.fastq > ./fastq_multx_trim_output-2/${i}.2.trim.fastq
done

