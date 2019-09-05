#!/bin/bash
set -e
set -x

## load module
module load star/2.5.2b

for i in /home/lombardi/HiSeq_1143/data/working_data/trimmed/trimmed_pe/TP-5-*_R1_trimmed_pe.fastq.gz; do
  Sample=$(basename --suffix _R1_trimmed_pe.fastq.gz ${i})
  STAR --runMode alignReads \
    --genomeLoad NoSharedMemory \
    --readFilesCommand zcat \
    --outSAMtype BAM SortedByCoordinate \
    --genomeDir /home/lombardi/HiSeq_1143/data/working_data/star/genome/ \
    --readFilesIn ${i} ${i%_R1_trimmed_pe.fastq.gz}_R2_trimmed_pe.fastq.gz \
    --outFileNamePrefix /home/lombardi/HiSeq_1143/data/working_data/star/star_mapping_ouput/star_output_TP5/${Sample}_ \
    --sjdbGTFfile /home/lombardi/HiSeq_1143/data/working_data/star/annotation/csi.gene.models.gtf \
    --quantMode GeneCounts;
done
