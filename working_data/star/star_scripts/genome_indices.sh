#!/bin/bash

## load star module
module load star/2.5.2b


## generating genome indices for STAR 
## completed 6/29/2018
## script uses .gtf annotation file, not .gff3 file
STAR --runMode genomeGenerate --genomeDir /home/lombardi/HiSeq_1143/data/working_data/star/genome \
--genomeFastaFiles /home/lombardi/HiSeq_1143/data/working_data/star/genome/csi.chromosome.fa \
--sjdbGTFfile /home/lombardi/HiSeq_1143/data/working_data/star/annotation/csi.gene.models.gtf \
--sjdbOverhang 149 --runThreadN 24 \
