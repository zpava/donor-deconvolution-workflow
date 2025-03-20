#!/bin/bash -l
##########################################################################
#
#  Script:    sortingbams.sh
#  Author:    ZulyP
#  Modified:  
#  Created:   14/04/2022 
#  Updated:	  
#  Note:      This script sorts, index and merge input bam files from cellranger multi pipeline output.
##########################################################################

###########
##Name of the job
#PBS -N sorting
#PBS -l mem=40GB,walltime=24:00:00
#PBS -l ncpus=8
#PBS -M zuleima.pavaimitola@qimrberghofer.edu.au
###########

##Preliminaries
## Load modules
module load samtools/1.9

DIR=/mnt/lustre/working/lab_michelbo/zuleiP/Gartlan
cd $DIR
output=$DIR/D_sorted_bams
mkdir -p D_sorted_bams
input=$DIR/C_suffix_change_bam

##sort and index alignments 

##First argument used for testing script.
 # samtools sort -O bam,level=1 -@8 -T $output/PD1Neg.sorted -o $output/PD1Neg.sorted.bam $input/PD1Neg_sample_alignments.bam
 # samtools index -b $output/PD1Neg.sorted.bam

 samtools sort -O bam,level=1 -@8 -T $output/B1.sorted -o $output/B1_sfx.sorted.bam $input/B1_sfx.bam
 samtools index -b $output/B1_sfx.sorted.bam

 samtools sort -O bam,level=1 -@8 -T $output/B2_sfx.sorted -o $output/B2_sfx.sorted.bam $input/B2_sfx.bam
 samtools index -b $output/B2_sfx.sorted.bam
 
 samtools sort -O bam,level=1 -@8 -T $output/B3_sfx.sorted -o $output/B3_sfx.sorted.bam $input/B3_sfx.bam
 samtools index -b $output/KG3_sfx.sorted.bam
 
 samtools sort -O bam,level=1 -@8 -T $output/B4_sfx.sorted -o $output/B4_sfx.sorted.bam $input/B4_sfx.bam
 samtools index -b $output/B4_sfx.sorted.bam
 
 samtools sort -O bam,level=1 -@8 -T $output/B5_sfx.sorted -o $output/B5_sfx.sorted.bam $input/B5_sfx.bam
 samtools index -b $output/B5_sfx.sorted.bam
 
 samtools sort -O bam,level=1 -@8 -T $output/B6_sfx.sorted -o $output/B6_sfx.sorted.bam $input/B6_sfx.bam
 samtools index -b $output/B6_sfx.sorted.bam
 
 samtools sort -O bam,level=1 -@8 -T $output/B7_sfx.sorted -o $output/B7_sfx.sorted.bam $input/B7_sfx.bam
 samtools index -b $output/B7_sfx.sorted.bam
 
 samtools sort -O bam,level=1 -@8 -T $output/B8_sfx.sorted -o $output/B8_sfx.sorted.bam $input/B8_sfx.bam
 samtools index -b $output/B8_sfx.sorted.bam
 
 samtools sort -O bam,level=1 -@8 -T $output/B10_sfx.sorted -o $output/B10_sfx.sorted.bam $input/B10_sfx.bam
 samtools index -b $output/B10_sfx.sorted.bam
 
 samtools sort -O bam,level=1 -@8 -T $output/B11_sfx.sorted -o $output/B11_sfx.sorted.bam $input/B11_sfx.bam
 samtools index -b $output/B11_sfx.sorted.bam
 
 samtools sort -O bam,level=1 -@8 -T $output/B12_sfx.sorted -o $output/B12_sfx.sorted.bam $input/B12_sfx.bam
 samtools index -b $output/B12_sfx.sorted.bam
 


	
	

	