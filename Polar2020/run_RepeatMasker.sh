#!/usr/bin/bash
# conda activate /data2/work/local/miniconda/envs/RepeatMask/

bin=/data2/work/local/RepeatMasker/RepeatMasker/RepeatMasker

#combine the database of Repeatmodeler and Zebrafish from repbase

repeat_modeler_path=
repbase_path=

cat $repeat_modeler_path $repbase_path > curated_repeats.fa

#Run Repeat Masker
dir=$PWD
#Genome assembly fasta file
genome=

/data/home/sb65/tools/RepeatMasker/RepeatMasker/RepeatMasker -a -lib ${dir}/curated_repeats.fa $genome -poly -gff -pa 120 -xsmall -dir ${dir} |& tee RepeatMasker.tmux.log
