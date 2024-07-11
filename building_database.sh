#!/bin/bash

qiime tools import \
  --type FeatureData[Sequence] \
  --input-path Gilliamella.fasta \
  --output-path Gilliamella.fasta.qza

qiime tools import \
  --type FeatureData[Taxonomy] \
  --input-format HeaderlessTSVTaxonomyFormat \
  --input-path Gilliamella.tax.tsv \
  --output-path Gilliamella.tax.qza