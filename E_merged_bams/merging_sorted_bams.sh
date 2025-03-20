#!/bin/bash -l


##########################################################################
#  Script:    sortingbams.sh
#  Author:    ZulyP
#  Modified:  
#  Created:   14/04/2022 
#  Updated:	  
#  Note:      This script merge sorted, suffix-fixed bam files from cellranger multi pipeline output.
##########################################################################

###########
##Name of the job
#PBS -N merging
#PBS -l mem=50GB,walltime=36:00:00
#PBS -l ncpus=10
#PBS -M zuleima.pavaimitola@qimrberghofer.edu.au
###########

##Preliminaries
## Load modules
module load samtools/1.9

DIR=/mnt/lustre/working/lab_michelbo/zuleiP/BTcells_rux
cd $DIR
output=$DIR/E_merged_bams
mkdir -p E_merged_bams
input=$DIR/D_sorted_bams

##merging sorted, suffix-fixed bam files
## If need to merge more than 4 bam files use the -b argument and provide a text file with a list of input bam files, one file per line.

samtools merge $output/B.merged.bam $input/B1_sfx.sorted.bam $input/B2_sfx.sorted.bam $input/B3_sfx.sorted.bam $input/B4_sfx.sorted.bam $input/B5_sfx.sorted.bam $input/B6_sfx.sorted.bam $input/B7_sfx.sorted.bam $input/B8_sfx.sorted.bam $input/B10_sfx.sorted.bam $input/B11_sfx.sorted.bam $input/B12_sfx.sorted.bam

##For sorting & indexing the merged bam file we only use the output directory.
samtools sort -O bam,level=1 -@10 -T $output/B.sorted.merged -o $output/B.sorted.merged.bam $output/B.merged.bam
samtools index -b $output/B.sorted.merged.bam