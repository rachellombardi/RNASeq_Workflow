#!/usr/bin/env bash
set -eo pipefail

for sample in $(cat sample-ids.txt)
do
    for x in 1 2 3 4
    do
        for end in 1 2
        do
            y=$x
            if [ "$x" -gt 2 ]; then
                y=$(($x-2))
            fi
            existing=$(pwd)/0_raw_data/Run_${x}_of_4/Run_${x}_of_4_raw_data/${sample}_L00${y}_R${end}_001.fastq.gz
            newfile=working_data/original/${sample}_L00${x}_R${end}.fastq.gz
            # ls $existing
            ln -s $existing $newfile
        done
    done
done
