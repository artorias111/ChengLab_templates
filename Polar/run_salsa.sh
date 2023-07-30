#!/bin/bash
#If you haven't, align the HiC (Illumina paired reads) data to the assembly first, see run_bowtie2.sh for more details
#path to bam file from bowtie's output
#aligned_bam=/data/work/Notothenioids/Lsquam3/Lsquam3_-_Scaffold_cur_results_2856599_bionano_HiC_bowtie2/aligned.bam

#The line below requires the bedtools package to be installed (installed in the conda environment in polar)
#bamToBed -i $aligned_bam > alignment.bed

#sort the bed file according to what salsa wants
#sort -k 4 alignment.bed > tmp && mv tmp alignment.bed

#path to the assembly you want fixed
genome=/data/work/Notothenioids/Lsquam3/Lsquam3_-_Scaffold_cur_results_2856599_bionano/cur_results_2856599/hybrid_scaffolds/EXP_REFINEFINAL1_bppAdjust_cmap_Lsquam3_cell1_2_hifiasm_v0_16_bp_p_ctg_purged_fa_NGScontigs_HYBRID_SCAFFOLD_NCBI.fasta
#run salsa on these files
samtools faidx $genome 
index="${genome}.fai"

/data/work/local/SALSA/run_pipeline.py -a $genome -l $index -b alignment.bed -e GCTACTCT -o scaffolds -m yes | tee tmux.log
