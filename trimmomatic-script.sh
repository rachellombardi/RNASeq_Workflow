#!/bin/bash

##Previously generated .txt file with sample-ids only (i.e. TP-1-10-S10 and not TP-1-10-S10-R1). This is the file referenced as sample-ids.txt. 
##executed on 6/6/2018 on merged files
## Daniel wuz here

##load trimmomatic
module load bio

##navigate to folder with merged files
cd /home/lombardi/HiSeq_1143/data/working_data/merged

##run trimmomatic
for sample in $(cat ../../sample-ids.txt)
do
    trimmomatic PE -threads 24\
        ${sample}_R1.fastq.gz ${sample}_R2.fastq.gz \
        ${sample}_R1_trimmed_pe.fastq.gz ${sample}_R1_trimmed_orphans.fastq.gz ${sample}_R2_trimmed_pe.fastq.gz ${sample}_R2_trimmed_orphans.fastq.gz \
        ILLUMINACLIP:/home/lombardi/HiSeq_1143/data/TruSeq3-PE-2.fa:2:40:15 \
        LEADING:2 TRAILING:2 \
        SLIDINGWINDOW:4:2 \
        MINLEN:36
done
