#!/bin/bash 


#PBS -N suffixChange
#PBS -l mem=16GB,walltime=08:00:00
#PBS -l ncpus=8
#PBS -M zuleima.pavaimitola@qimrberghofer.edu.au


##########################################################################
#  Script:    change_suffix_bam.sh
#  Author:    ZulyP
#  Modified:  
#  Created:   14/04/2022 
#  Updated:	  
#  Note:      This script change the suffix of the cell barcode within the sorted bam file.
##########################################################################


## MEM=16GB
## NCPU=8
## M=zuleima.pavaimitola@qimrberghofer.edu.au
## N=suffixChange

DIR=/mnt/lustre/working/lab_michelbo/zuleiP/CHMI_202204/deplexing
cd $DIR
output=$DIR/C_suffix_change_bam
mkdir -p C_suffix_change_bam
input=$DIR/A_bams

##Preliminaries
module load python/3.6.1

python change_suffix_3p_bamZP.py -a $input/MS2201MonoDay0.bam -b $output/MS2201MonoDay0_sfx.bam -c 5

