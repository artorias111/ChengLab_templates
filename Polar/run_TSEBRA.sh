#!/bin/bash

#TSEBRA paths
bin=/home/sb65/tools/TSEBRA/bin

#path to BRAKER2 predictions
protein=/data/work/Notothenioids/Dele4/Dele4_ccs_cells1+2+3_HifiasmV0.16_BRAKER/brakerP_042723
#path to BRAKER1 predictions
transc=/data/work/Notothenioids/Dele4/Dele4_ccs_cells1+2+3_HifiasmV0.16_BRAKER/brakerT_042723

#Fix GTF IDs
${bin}/fix_gtf_ids.py --gtf ${protein}/braker.gtf --out ${protein}/brakerP_fixed.gtf
${bin}/fix_gtf_ids.py --gtf ${transc}/braker.gtf --out ${transc}/brakerR_fixed.gtf

${bin}/tsebra.py \
    -g ${protein}/brakerP_fixed.gtf,${transc}/brakerR_fixed.gtf \
    -c ${bin}/../config/default.cfg \
    -e ${protein}/hintsfile.gff,${transc}/hintsfile.gff \
    -o brakerPR.gtf | tee tmux.log
