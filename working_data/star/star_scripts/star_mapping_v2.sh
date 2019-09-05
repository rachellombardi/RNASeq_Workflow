#!/bin/bash
set -e
set -x

## load module
module load star/2.5.2b

for i in /home/lombardi/HiSeq_1143/data/working_data/trimmed/trimmed_pe/*_R1_trimmed_pe.fastq.gz; do
  STAR --runMode alignReads \
    --genomeLoad NoSharedMemory \
    --readFilesCommand zcat \
    --outSAMtype BAM Unsorted SortedByCoordinate \
    --genomeDir /home/lombardi/HiSeq_1143/data/working_data/star/genome/ \
    --readFilesIn /home/lombardi/HiSeq_1143/data/working_data/trimmed/trimmed_pe/${i} /home/lombardi/HiSeq_1143/data/working_data/trimmed/trimmed_pe/${i%_R1_trimmed_pe.fastq.gz}_R2_trimmed_pe.fastq.gz \
    --outFileNamePrefix /home/lombardi/HiSeq_1143/data/working_data/star/star_mapping_ouput \
    --outSAMattributes Standard \
    --outSAMunmapped Within ;
done
