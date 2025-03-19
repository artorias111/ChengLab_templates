#!/bin/bash

# Define the variables
genome=/data2/work/Gadids/Gmac_EBS74/Gmac_EB74.15_15_hifasm_HiC_integrated_yahs_RepeatMasking/RepeatMasker/yahs.out_scaffolds_final.fa.masked
# Drerio protein reference
prot=/data2/work/Vertebrate_repeats/Drerio_proteome/uniprotkb_proteome_UP000000437_2024_07_10.fasta
# Align RNA-seq reads against the reference and add the bam file here
bam=/data2/work/Gadids/Gmac_EBS74/Gmac_EB74.15_15_hifasm_HiC_integrated_yahs_RNAseq_aligned/new_STAR/Aligned.sorted.bam

# Run BRAKER3
singularity exec /data/home/sb65/braker_test/braker3.sif braker.pl \
    --AUGUSTUS_ab_initio \
    --gff3 \
    --threads=32 \
    --genome=$genome \
    --prot_seq=$prot \
    --bam=$bam \
    --softmasking \
    --workingdir=$PWD \
    --makehub --email sb65@illinois.edu | tee braker.tmux.log
