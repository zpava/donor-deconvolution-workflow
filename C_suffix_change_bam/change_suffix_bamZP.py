#########################################################
#
#  Script:    02_change_suffix_bam.py
#  version:   python-3.8.6
#  Keywords:  #bam
#  Author:    Josh Lee
#  Created:   11/06/2021
#  Updated:   23/09/2021
#  Note:      Change the suffix of cell barcodes embedded in cigar string [CB]. BAM files are output of `cellranger count` run.
#             First run to change suffix of Duodenum. Second run to change suffix of Liver/Skin. Also modified to take in inputs using argparse.
#########################################################

##This is what I need to run in command line.
#python change_suffix_bamZP.py -a bams/Tfh1_sample_alignments.bam -b suffix_change_sortedbam/Tfh1_suffix_sorted.bam -c 2


#module load python/3.6.1
import pysam
import argparse

#########################################################
## Set Paths
#data_path = "/data/scratch/projects/punim1266/human_trm/merged/"
#########################################################

## Testing with BAM subset
##############################
## Subset BAM file
#module load samtools/1.9
#samtools view -bo Duodenum_subset.bam -s 123.1 Duodenum_sample_alignments.bam chr1
##############################

parser = argparse.ArgumentParser(description="To convert suffix of cell barcodes in [CB]")
parser.add_argument('-a', '--inputone', help="Input file one name",required=True)
parser.add_argument('-b', '--outputone', help="Output one file name",required=True)
parser.add_argument('-c', '--number', help="Suffix number",required=True)

args = parser.parse_args()

infileone = args.inputone
outfileone = args.outputone
number = args.number

## Read bc metadata including clonotype information
inbamfile = pysam.AlignmentFile(infileone,"rb")
## Need to set the headers - below to be copied from the input bam file.
outbamfile = pysam.AlignmentFile(outfileone,"wb",template=inbamfile)

for line in inbamfile:
    ## getting the relevant tags
    cellbc = line.get_tag("CB")
    ur = line.get_tag("UR")
    uy = line.get_tag("UY")
    ## [UB] tag is not present in every line. Set conditional
    if line.has_tag("UB"):
        ub = line.get_tag("UB")
    ## Change the suffix of cell barcode
    n_cellbc = '-'.join([cellbc.split('-')[0],number])
    ## Set the tag value to the changed cell barcode
    line.set_tag('CB',n_cellbc)
    line.set_tag('UR',ur)
    line.set_tag('UY',uy)
    if line.has_tag("UB"):
        line.set_tag('UB',ub)
    ## Write to output file
    outbamfile.write(line)