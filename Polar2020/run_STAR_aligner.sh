#!/bin/bash



# Path to the masked assembly if using BRAKER downstream
fasta=
# RNAseq reads, in fq.gz file format (needs to be compressed, doesn't work uncompressed')
# Reads can be trimmed with fastp
reads=



### DO NOT EDIT BELOW THIS LINE


index=$PWD
#Generate an index of the reference genome

/data2/work/local/STAR/STAR-2.7.11a/bin/Linux_x86_64/STAR --runThreadN 64 --runMode genomeGenerate --genomeDir $index --genomeFastaFiles $fasta --sjdbOverhang=MateLength-1 --genomeSAindexNbases 13 | tee genIndex.tmux.log

#Run star after generating the index
/data2/work/local/STAR/STAR-2.7.11a/bin/Linux_x86_64/STAR --genomeDir $index --readFilesIn $reads --readFilesCommand zcat --outSAMunmapped Within --runThreadN 64 | tee align.tmux.log

samtools view -b -S -@ 60 Aligned.out.sam > Aligned.out.bam 
