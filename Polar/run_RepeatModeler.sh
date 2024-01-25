#!/bin/bash

#conda activate RepeatMasking
#paths to RepeatModeler and genome assembly
src=/home/sb65/tools/RepeatModeler/RepeatModeler-2.0.3
fasta=/data/work/Dmaw12/Dmaw12_-_Scaffold_-_arks_cur_results_2856604_bionano/cur_results_2856605/hybrid_scaffolds/EXP_REFINEFINAL1_bppAdjust_cmap_Dmaw12_3cell_HifiasmV0_16_purge_haplotigs_arks_scaffolds_fa_NGScontigs_HYBRID_SCAFFOLD.fasta

# RepModeler Build Database
$src/BuildDatabase -name asm.db -engine ncbi $fasta

# RepModeler Model Repeats
$src/RepeatModeler -database asm.db -engine ncbi -pa 45 -LTRStruct
