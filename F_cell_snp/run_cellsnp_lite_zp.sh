#!/bin/bash -l

##########################################################################
#  Script:    cellSNP.sh
#  Author:    Josh Lee
#  Modified:  Zuly Pava
#  Created:   07/06/2021  
#  Updated:	  14/04/2022
#  Note:      Running cellSNP on merged dataset.
##########################################################################

###########
##Name of the job
#PBS -N cellsnp-lite
#PBS -l mem=40GB,walltime=48:00:00
#PBS -l ncpus=8
#PBS -M zuleima.pavaimitola@qimrberghofer.edu.au
###########


## Load modules
module load samtools/1.9
module load cellsnp-lite/1.2.2

DIR=/mnt/lustre/working/lab_michelbo/zuleiP/BTcells_rux

MBAMS=$DIR/E_merged_bams/"B.sorted.merged.bam"
MBARCODE=$DIR/B_cell_barcodes/"merged_barcodes.tsv.gz"
OUT_DIR=$DIR/F_cell_snp
REGION_VCF="/mnt/lustre/working/lab_michelbo/zuleiP/cellranger_reference_data/genome1K.phase3.SNP_AF5e2.chr1toX.hg38.vcf.gz"

## Run cellSNP mode 2a.
cellsnp-lite -s "${MBAMS}" -b "${MBARCODE}" -O "${OUT_DIR}" -R "${REGION_VCF}" -p 20 --minMAF 0.1 --minCOUNT 20 --gzip