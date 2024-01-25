#!/usr/bin/bash
# conda activate /data2/work/local/miniconda/envs/RepeatMask/

#paths to RepeatModeler and genome assembly
src=/data2/work/local/RepeatModeler/RepeatModeler-2.0.5
fasta=

# RepModeler Build Database
$src/BuildDatabase -name asm.db -engine ncbi $fasta  |& tee RepeatModeler_BuildDB.tmux.log

# RepModeler Model Repeats
$src/RepeatModeler -database asm.db -engine ncbi -threads 172 -LTRStruct |& tee RepeatModeler.tmux.log
