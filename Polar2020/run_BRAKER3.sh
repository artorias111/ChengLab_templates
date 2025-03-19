#!/bin/bash
# conda activate /data2/work/local/miniconda/envs/braker/

export AUGUSTUS_SCRIPTS_PATH=/data2/work/local/Augustus/scripts
export AUGUSTUS_CONFIG_PATH=/data/home/sb65/AUGUSTUS_config
export AUGUSTUS_BIN_PATH=/data2/work/local/Augustus/bin
export BAMTOOLS_PATH=/data2/work/local/bamtools/src
export PROTHINT_PATH=/data2/work/local/ProtHint/ProtHint-2.6.0/bin
export DIAMOND_PATH=/usr/local/bin
export CDBTOOLS_PATH=/data2/work/local/cdbfasta
export PERL5LIB=/data2/work/local/miniconda/envs/braker/lib/
export GENEMARK_PATH=/data2/work/local/GeneMark-ETP/bin/gmes
export MAKEHUB_PATH=/data2/work/local/MakeHub
export PATH=$PATH:/data2/work/local/stringtie/stringtie-2.2.3.Linux_x86_64:/data2/work/local/gffread/gffread-0.12.7.Linux_x86_64:/data2/work/local/compleasm/compleasm_kit
export ALIGNMENT_TOOL_PATH=/home/sb65/bin
export HISAT2_PATH=/data2/work/local/Hisat2/hisat2-2.2.1

# Define the variables
genome=
# Drerio protein reference
prot=/data2/work/Vertebrate_repeats/Drerio_proteome/uniprotkb_proteome_UP000000437_2024_07_10.fasta
rnaseq=


# Run BRAKER3
/data2/work/local/BRAKER/scripts/braker.pl \
    --AUGUSTUS_ab_initio \
    --gff3 \
    --cores 64 \
    --genome=$genome \
    --prot_seq=$prot \
    --rnaseq_sets_dirs=$rnaseq \
    --softmasking \
    --workingdir=$PWD \
    --makehub --email sb65@illinois.edu | tee braker.tmux.log
