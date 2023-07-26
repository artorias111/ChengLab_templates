#!/bin/bash

fasta=
index=$PWD

#Generate an index of the reference genome

/data/work/local/STAR-2.7.10a/bin/Linux_x86_64/STAR --runThreadN 60 --runMode genomeGenerate --genomeDir $index --genomeFastaFiles $fasta --sjdbOverhang=MateLength-1 --genomeSAindexNbases 13

#RNAseq reads, in fq.gz file format (needs to be compressed, doesn't work uncompressed')
reads=/data/work/Dmaw12/sra_rnaseq_dmaw/fastq_files/combined/all.fq.gz

#Run star after generating the index
/data/work/local/STAR-2.7.10a/bin/Linux_x86_64/STAR --genomeDir $index --readFilesIn $reads --readFilesCommand zcat --outSAMunmapped Within --runThreadN 60

samtools view -b -S -@ 60 Aligned.out.sam > Aligned.out.bam | tee tmux.log
