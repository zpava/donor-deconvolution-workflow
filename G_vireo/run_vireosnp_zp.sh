#!/bin/bash -l
##########################################################################
#
#  Script:    20211005_03_vireosnp.sh
#  Author:    Josh Lee
#  Modified:  Zuly Pava
#  Created:   2021-10-05
#  Updated:	  21-04-21 
###########################################################################

###########
##Name of the job
#PBS -N vireosnp
#PBS -l mem=40GB,walltime=24:00:00
#PBS -l ncpus=8
#PBS -M zuleima.pavaimitola@qimrberghofer.edu.au
###########

## Load python
module load bcftools/1.9
module load python/3.6.1
pip install vireoSNP

##compressing vcf from cellsnp-lite_output
cd /mnt/lustre/working/lab_michelbo/zuleiP/BTcells_rux/F_cell_snp
bcftools view -O z -o cellSNP.base.vcf.gz cellSNP.base.vcf

##vireo preliminaries.
DIR=/mnt/lustre/working/lab_michelbo/zuleiP/BTcells_rux

cd $DIR

n_donor=8
CELL_DATA=$DIR/F_cell_snp
OUT_DIR=$DIR/G_vireo

mkdir -p G_vireo

vireo -c "${CELL_DATA}" -N "${n_donor}" -o "${OUT_DIR}"