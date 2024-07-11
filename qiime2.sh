#!/bin/bash

qiime tools import \
  --type 'SampleData[PairedEndSequencesWithQuality]' \
  --input-path sample-path.tsv \
  --output-path marker.gene.qza \
  --input-format PairedEndFastqManifestPhred33V2

qiime demux summarize \
  --i-data marker.gene.qza \
  --o-visualization marker.gene.qzv


qiime dada2 denoise-paired \
  --i-demultiplexed-seqs marker.gene.qza  \
  --p-trim-left-f 0 \
  --p-trim-left-r 0 \
  --p-trunc-len-f 144 \
  --p-trunc-len-r 144 \
  --o-table feature-table.qza \
  --o-representative-sequences rep-seqs.qza \
  --o-denoising-stats denoising-stats.qza \
  --p-n-threads 10

qiime feature-table summarize \
  --i-table feature-table.qza \
  --o-visualization feature-table.qzv \
  --m-sample-metadata-file sample-metadata.tsv

qiime feature-table tabulate-seqs \
  --i-data rep-seqs.qza \
  --o-visualization rep-seqs.qzv

qiime metadata tabulate \
  --m-input-file denoising-stats.qza \
  --o-visualization denoising-stats.qzv

qiime feature-classifier classify-consensus-blast \
  --i-query rep-seqs.qza  \
  --i-reference-reads Gilliamella.fasta.qza \
  --i-reference-taxonomy Gilliamella.tax.qza \
  --o-classification classified-seqs.qza \
  --p-perc-identity 0.97

qiime metadata tabulate \
  --m-input-file classified-seqs.qza \
  --o-visualization classified-seqs.qzv


qiime taxa barplot \
  --i-table feature-table.qza \
  --i-taxonomy classified-seqs.qza \
  --m-metadata-file sample-metadata.tsv \
  --o-visualization taxa-bar-plots.qzv

