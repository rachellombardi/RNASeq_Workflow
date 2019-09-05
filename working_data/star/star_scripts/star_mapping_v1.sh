#!/bin/bash
set -e
set -x

## load module
module load star/2.5.2b

for i in $(cat /home/lombardi/HiSeq_1143/data/star-sample-ids.txt)
do
    echo "working on" /home/lombardi/HiSeq_1143/data/working_data/trimmed/trimmed_pe/${i}_R1_trimmed_paired.fastq.gz /home/lombardi/HiSeq_1143/data/working_data/trimmed/trimmed_pe/${i}_R2_trimmed_paired.fastq.gz
    STAR --runMode alignReads \
    --genomeLoad  NoSharedMemory \
    --readFilesCommand zcat \
    --outSAMtype BAM Unsorted SortedByCoordinate \
    --genomeDir /home/lombardi/HiSeq_1143/data/working_data/star/genome/ \
    --readFilesIn /home/lombardi/HiSeq_1143/data/working_data/trimmed/trimmed_pe/${i}_R1_trimmed_paired.fastq.gz /home/lombardi/HiSeq_1143/data/working_data/trimmed/trimmed_pe/${i}_R2_trimmed_paired.fastq.gz \
    --runThreadN 24 \
    --outFileNamePrefix /home/lombardi/HiSeq_1143/data/working_data/star/star_mapping_ouput \
    --outSAMattributes Standard \
    --outSAMunmapped Within \
done
