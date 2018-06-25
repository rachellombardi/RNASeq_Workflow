#!/bin/bash

## load star module
module load star/2.5.2b


## generating genome indices
## completed 6/22/2018
STAR --runThreadN 24 --runMode genomeGenerate --genomeDir /home/lombardi/HiSeq_1143/data/working_data/star/indexed_genome \
--genomeFastaFiles /home/lombardi/HiSeq_1143/data/working_data/star/genome/csi.chromosome.fa \
--sjdbGTFfile /home/lombardi/HiSeq_1143/data/working_data/star/annotation_GFF3/csi.gene.models.gff3 \
--sjdbGTFtagExonParentTranscript Parent --sjdbOverhang 149 \
