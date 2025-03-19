#!/usr/bin/bash
# conda activate /data2/work/local/miniconda/envs/RepeatMask/

bin=/data2/work/local/RepeatMasker/RepeatMasker/RepeatMasker
repbase_path=/data2/work/Vertebrate_repeats/RepBase/standard_repeats.fa


### DO NOT EDIT ABOVE THIS LINE - make sure you activate the conda environment before running the file

# Path to the fasta file of modeled repeats by repeatmodeler
repeat_modeler_path=
#Genome assembly fasta file
genome=


### DO NOT EDIT BELOW THIS LINE

#combine the database of Repeatmodeler and Zebrafish from repbase

cat $repeat_modeler_path $repbase_path > curated_repeats.fa

#Run Repeat Masker
dir=$PWD
$bin -a -lib ${dir}/curated_repeats.fa $genome -poly -gff -pa 64 -xsmall -dir ${dir} |& tee RepeatMasker.tmux.log
