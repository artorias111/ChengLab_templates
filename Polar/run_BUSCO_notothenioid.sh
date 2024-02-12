#/bin/bash
#conda activate /data/work/local/miniconda/envs/busco5

#path to assembly fasta
fasta=

busco -i $fasta -o $PWD -m geno -l actinopterygii --augustus_species zebrafish -c 45 -f --offline --download_path /home/sb65/busco_temp/
