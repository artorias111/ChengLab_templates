#!/bin/bash
#conda activate braker2

export AUGUSTUS_SCRIPTS_PATH=/data/work/local/Augustus/scripts
export AUGUSTUS_CONFIG_PATH=/home/sb65/augustus_config
export AUGUSTUS_BIN_PATH=/data/work/local/Augustus/bin
export BAMTOOLS_PATH=/data/work/local/bamtools/bamtools_install/bin/
export PROTHINT_PATH=/data/work/local/ProtHint/bin
export DIAMOND_PATH=/usr/local/bin
export CDBTOOLS_PATH=/data/work/local/cdbfasta
export PERL5LIB=/home/sb65/miniconda3/pkgs
export GENEMARK_PATH=/home/sb65/tools/GeneMark/gmes_linux_64_4
export MAKEHUB_PATH=/data/work/local/MakeHub

braker=/data/work/local/BRAKER-2.1.6/scripts

#path to protein reference
prot=/data/work/Notothenioids/Dmaw12_Dele4/ref/Vertebrata.fa
#Masked genome
genome=
#output/working directory
dir=$PWD

${braker}/braker.pl \
    --AUGUSTUS_ab_initio \
    --gff3 \
    --cores 15 \
    --genome=$genome \
    --prot_seq=${prot} \
    --epmode \
    --softmasking \
    --workingdir=${dir} \
    --BLAST_PATH=/usr/local/bin \
    --makehub --email sb65@illinois.edu | tee tmux.log
