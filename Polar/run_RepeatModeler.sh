#!/bin/bash
#combine the database of Repeatmodeler and Zebrafish from repbase

repeat_modeler_path=
repbase_path=

cat $repeat_modeler_path $repbase_path > curated_repeats.fa

#Run Repeat Masker
bin=/home/sb65/tools/RepeatMasker/RepeatMasker
dir=$PWD
#Genome assembly fasta file
genome=

/data/home/sb65/tools/RepeatMasker/RepeatMasker/RepeatMasker -a -lib ${dir}/curated_repeats.fa $genome -poly -gff -pa 50 -xsmall -dir ${dir} | tee tmux.log
