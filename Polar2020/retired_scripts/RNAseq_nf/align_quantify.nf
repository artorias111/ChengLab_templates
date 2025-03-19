#!/usr/bin/env nextflow

// Parameters for the reference genome and the paired end reads 

params.readsDir = "/data2/work/Notothenioids/fTreBer/ftreBer_CTmax_STAR/trimmed_reads/reads"
params.genomeFasta = "/data2/work/Notothenioids/fTreBer/ncbi_dataset/GCF_902827165.1_fTreBer1.1_genomic.fna"
params.annotationGtf = "/data2/work/Notothenioids/fTreBer/ncbi_dataset/GCF_902827165.1_fTreBer1.1_genomic.gtf"

#!/usr/bin/env nextflow

params.genomeFasta = "path/to/genome.fasta"
params.annotationGtf = "path/to/annotation.gtf"
params.readsDir = "path/to/reads/"
params.threads = 160

process createGenomeIndex {
    input:
    path genomeFasta
    path annotationGtf

    output:
    path "STARIndex/"

    script:
    """
    /data2/work/local/STAR/STAR-2.7.11a/bin/Linux_x86_64/STAR \
        --runThreadN ${params.threads} \
        --runMode genomeGenerate \
        --genomeDir STARIndex \
        --genomeFastaFiles ${genomeFasta} \
        --sjdbGTFfile ${annotationGtf} \
        --sjdbOverhang 148
        --genomeSAindexNbases 13
    """
}

process alignReads {
    input:
    path "STARIndex/"
    tuple val(sample_id), path(reads)

    output:
    path "aligned/${sample_id}.bam"

    script:
    """
    /data2/work/local/STAR/STAR-2.7.11a/bin/Linux_x86_64/STAR \
        --runThreadN ${params.threads} \
        --genomeDir STARIndex \
        --readFilesIn ${reads[0]} ${reads[1]} \
        --readFilesCommand zcat \
        --outFileNamePrefix aligned/${sample_id}_ \
        --outSAMtype BAM SortedByCoordinate \
        --outSAMunmapped Within \
        --alignSoftclipAtReferenceEnds No \
        --outSAMattrIHstart 0 \
        --outSAMstrandField intronMotif
    """
}

workflow {
    // Step 1: Create the genome index
    createGenomeIndex(genomeFasta: file(params.genomeFasta), annotationGtf: file(params.annotationGtf))

    // Step 2: Align reads in parallel
    Channel
        .fromFilePairs("${params.readsDir}/*_R{1,2}.fastq.gz", flat: true)
        .map { sample_id, reads -> tuple(sample_id, reads) }
        | alignReads
}
