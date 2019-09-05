#!/bin/bash
set -e
set -x

## load module
module load star/2.5.2b

## Practice aligning reads to citrus annotation project genome
echo STAR --runMode alignReads \
--genomeLoad  NoSharedMemory \
--readFilesCommand zcat \
--outSAMtype BAM Unsorted SortedByCoordinate \
--genomeDir /home/lombardi/HiSeq_1143/data/working_data/star/genome/ \
--readFilesIn /home/lombardi/HiSeq_1143/data/working_data/merged/TP-1-10_S10_R1.fastq.gz /home/lombardi/HiSeq_1143/data/working_data/merged/TP-1-10_S10_R2.fastq.gz \
--runThreadN 24 \
--outFileNamePrefix /home/lombardi/HiSeq_1143/data/working_data/star/aligned \
--outSAMattributes Standard \
--outSAMunmapped Within \
