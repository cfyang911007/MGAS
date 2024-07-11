#!/bin/bash

#to demux the mixed samples and remove the barcodes in forward reads
	
#make documents
	mkdir fastq_multx_output-1
	mkdir fastq_multx_output-2
	mkdir fastq_multx_trim_output-1
	mkdir fastq_multx_trim_output-2
	mkdir fastq_multx_trim_output

#demux
sh demux.sh

#make sample.list
for i in `ls fastq_multx_output-1/*.1.fastq`;do a=${i/.1.fastq/};a=${a/fastq_multx_output-1\//};echo "$a";done > sample.list

#trim the barcode with 6 bp in the reverse.fastq
sh seqtk.sh sample.list

#merge seq
for i in `cat sample.list`;do echo "cat fastq_multx_output-1/$i.1.fastq fastq_multx_trim_output-2/$i.2.trim.fastq > ./fastq_multx_trim_output/$i.1.fastq";done > command.combine.forward.list

for i in `cat sample.list`;do echo "cat fastq_multx_trim_output-1/$i.2.trim.fastq fastq_multx_output-2/$i.1.fastq > ./fastq_multx_trim_output/$i.2.fastq";done > command.combine.reverse.list

sh command.combine.forward.list
sh command.combine.reverse.list









