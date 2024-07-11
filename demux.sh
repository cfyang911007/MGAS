#!/bin/bash
#demux
declare -a names=(
    FRR1
    FRR2
   
    
)
for i in ${names[@]};do
  p="/cleandata" #Path to cleandata file
  PREFIX=$i

  fastq-multx \
  -B /home/ycf/data_analysis/marker_genes/20231117/00.barcode/$PREFIX\_barcode.txt \
  -m 1 \
  -b /$p/$PREFIX.clean.1.fq.gz /$p/$PREFIX.clean.2.fq.gz \
  -o ./fastq_multx_output-1/%.1.fastq \
  -o ./fastq_multx_output-1/%.2.fastq

  fastq-multx \
  -B /home/ycf/data_analysis/marker_genes/20231117/00.barcode/$PREFIX\_barcode.txt \
  -m 1 \
  -b /$p/$PREFIX.clean.2.fq.gz /$p/$PREFIX.clean.1.fq.gz \
  -o ./fastq_multx_output-2/%.1.fastq \
  -o ./fastq_multx_output-2/%.2.fastq
  
done

