# Hi-C contact map plot script

# activate conda environment

# assign variables

contigs_index=/data2/work/Gadids/Gogac_Godhavn/Gogac_godhavn_cell1-2_hifiasm_HiC_integrated/Gogac_godhavn_cell1-2_hifiasm_HiC_integrated.asm.hic.p_ctg.fa.fai  # path to the contigs fasta index (pre-assembly)


yahs_scaffold_bin_file=/data2/work/Gadids/Gogac_Godhavn/Gogac_godhavn_cell1-2_hifiasm_HiC_integrated_yahs/yahs.out.bin

yahs_scaffold_agp_file=/data2/work/Gadids/Gogac_Godhavn/Gogac_godhavn_cell1-2_hifiasm_HiC_integrated_yahs/yahs.out_scaffolds_final.agp


# run the script for generating the hic file from yahs output

(/data2/work/local/yahs/juicer pre $yahs_scaffold_bin_file $yahs_scaffold_agp_file $contigs_index | sort -k2,2d -k6,6d -T ./ --parallel=8 -S32G | awk 'NF' > alignments_sorted.txt.part) 2>sizes.stdoutfile && (mv alignments_sorted.txt.part alignments_sorted.txt) 

grep -Ev "^\[" sizes.stdoutfile | awk '{print $2, " ", $3}' > sizes.txt 


(java -jar -Xmx32G /data2/work/local/juicer_tools/juicer_tools.2.20.00.jar pre alignments_sorted.txt out.hic.part sizes.txt) && (mv out.hic.part out.hic)
