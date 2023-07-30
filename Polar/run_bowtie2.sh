#conda activate /data/work/local/miniconda/envs/salsa
BT2_HOME=/data/work/local/miniconda/envs/salsa/bin

#location of the genome to be aligned to
fasta=
$BT2_HOME/bowtie2-build $fasta genome_index | tee tmux_index.log

#location of the paired fastq files
fq1=
fq2=

#align the reads after creating the indices
$BT_HOME/bowtie2 -x genome_index -1 $fq1 -2 $fq2 -S aligned.sam
samtools view -bS aligned.sam > aligned.bam
