#!/bin/bash

## load star module
module load star/2.5.2b


## generating genome indices
## completed 6/25/2018
STAR --runThreadN 24 --runMode genomeGenerate --genomeDir /home/lombardi/HiSeq_1143/data/working_data/star/indexed_genome --genomeFastaFiles /home/lombardi/HiSeq_1143/$


