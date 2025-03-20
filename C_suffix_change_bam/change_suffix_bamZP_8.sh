#!/bin/bash 


#PBS -N suffixChange
#PBS -l mem=16GB,walltime=08:00:00
#PBS -l ncpus=8
#PBS -M zuleima.pavaimitola@qimrberghofer.edu.au


##########################################################################
#  Script:    change_suffix_bam.sh
#  Author:    ZulyP
#  Modified:  
#  Created:   07/12/2023 
#  Updated:	  
#  Note:      This script change the suffix of the cell barcode within the sorted bam file.
##########################################################################


## MEM=16GB
## NCPU=8
## M=zuleima.pavaimitola@qimrberghofer.edu.au
## N=suffixChange

DIR=/mnt/lustre/working/lab_michelbo/zuleiP/BTcells_rux
cd $DIR
output=$DIR/C_suffix_change_bam
mkdir -p C_suffix_change_bam
input=$DIR/A_bams

##Preliminaries
module load python/3.6.1

python change_suffix_bamZP.py -a $input/B8.bam -b $output/B8_sfx.bam -c 8

