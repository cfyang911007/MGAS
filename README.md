#MGAS

The approach used to sequencing processing and Gilliamella relative abundance qutification


#01.rawdata_to_read_summarization

Commands are detailed in the bash-script:

fastp.sh


#02.demultiplexing sequences

Commands are detailed in the bash-script:

workflow.sh


#This script contains the flowing processes:

#a. Using fastq-multx to splite the mixed samples

demux.sh

#b. Using seqtk to trim the barcode with 6 bp in the reverse.fastq

seqtk.sh

#c. Merge the demultiplexing sequences



#03.qiime2

Commands are detailed in the bash-script:

workflow.sh


#The script to built a database containing Gilliamella marker gene sequence is given in:

"building_database.sh"

The input file are: "Gilliamella.fasta" and "Gilliamella.tax.tsv"

