#!/usr/bin/env bash
set -eo pipefail

for sample in $(cat sample-ids.txt)
do
    for end in 1 2
    do
        # ls working_data/original/${sample}_L00{1..4}_R${end}.fastq.gz
        echo cat working_data/original/${sample}_L00{1..4}_R${end}.fastq.gz > working_data/merged/${sample}_R${end}.fastq.gz
    done
done

