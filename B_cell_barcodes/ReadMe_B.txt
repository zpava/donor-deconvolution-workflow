## 7 Dec 2023
## Zuleima Pava
## Moving filtered barcodes from multi-pipeline directory to cellsnp_lite working directory.
## Working directly on command line.

A. Where the cell barcodes were moved and rename.
cd /mnt/lustre/working/lab_michelbo/zuleiP/BTcells_rux/B_cell_barcodes

##B1 - 32K
cp -avu /mnt/lustre/working/genomeinfo/share/analysis/Boyle_-_NextSeq_scRNA/scRNA_JH_October2023/Multi_Analysis/JH_B1_Multi_Nov2023/outs/per_sample_outs/JH_B1_Multi_Nov2023/count/sample_filtered_feature_bc_matrix/barcodes.tsv.gz B1_barcodes.tsv.gz 

cp -avu /mnt/lustre/working/genomeinfo/share/analysis/Boyle_-_NextSeq_scRNA/scRNA_JH_October2023/Multi_Analysis/JH_B2_Multi_Nov2023/outs/per_sample_outs/JH_B2_Multi_Nov2023/count/sample_filtered_feature_bc_matrix/barcodes.tsv.gz B2_barcodes.tsv.gz 

cp -avu /mnt/lustre/working/genomeinfo/share/analysis/Boyle_-_NextSeq_scRNA/scRNA_JH_October2023/Multi_Analysis/JH_B3_Multi_Nov2023/outs/per_sample_outs/JH_B3_Multi_Nov2023/count/sample_filtered_feature_bc_matrix/barcodes.tsv.gz B3_barcodes.tsv.gz

cp -avu /mnt/lustre/working/genomeinfo/share/analysis/Boyle_-_NextSeq_scRNA/scRNA_JH_October2023/Multi_Analysis/JH_B4_Multi_Nov2023/outs/per_sample_outs/JH_B4_Multi_Nov2023/count/sample_filtered_feature_bc_matrix/barcodes.tsv.gz B4_barcodes.tsv.gz

cp -avu /mnt/lustre/working/genomeinfo/share/analysis/Boyle_-_NextSeq_scRNA/scRNA_JH_October2023/Multi_Analysis/JH_B5_Multi_Nov2023/outs/per_sample_outs/JH_B5_Multi_Nov2023/count/sample_filtered_feature_bc_matrix/barcodes.tsv.gz B5_barcodes.tsv.gz

cp -avu /mnt/lustre/working/genomeinfo/share/analysis/Boyle_-_NextSeq_scRNA/scRNA_JH_October2023/Multi_Analysis/JH_B6_Multi_Nov2023/outs/per_sample_outs/JH_B6_Multi_Nov2023/count/sample_filtered_feature_bc_matrix/barcodes.tsv.gz B6_barcodes.tsv.gz

cp -avu /mnt/lustre/working/genomeinfo/share/analysis/Boyle_-_NextSeq_scRNA/scRNA_JH_October2023/Multi_Analysis/JH_B7_Multi_Nov2023/outs/per_sample_outs/JH_B7_Multi_Nov2023/count/sample_filtered_feature_bc_matrix/barcodes.tsv.gz B7_barcodes.tsv.gz

cp -avu /mnt/lustre/working/genomeinfo/share/analysis/Boyle_-_NextSeq_scRNA/scRNA_JH_October2023/Multi_Analysis/JH_B8_Multi_Nov2023/outs/per_sample_outs/JH_B8_Multi_Nov2023/count/sample_filtered_feature_bc_matrix/barcodes.tsv.gz B8_barcodes.tsv.gz

cp -avu /mnt/lustre/working/genomeinfo/share/analysis/Boyle_-_NextSeq_scRNA/scRNA_JH_October2023/Multi_Analysis/JH_B10_Multi_Nov2023/outs/per_sample_outs/JH_B10_Multi_Nov2023/count/sample_filtered_feature_bc_matrix/barcodes.tsv.gz B10_barcodes.tsv.gz

cp -avu /mnt/lustre/working/genomeinfo/share/analysis/Boyle_-_NextSeq_scRNA/scRNA_JH_October2023/Multi_Analysis/JH_B11_Multi_Nov2023/outs/per_sample_outs/JH_B11_Multi_Nov2023/count/sample_filtered_feature_bc_matrix/barcodes.tsv.gz B11_barcodes.tsv.gz

cp -avu /mnt/lustre/working/genomeinfo/share/analysis/Boyle_-_NextSeq_scRNA/scRNA_JH_October2023/Multi_Analysis/JH_B12_Multi_Nov2023/outs/per_sample_outs/JH_B12_Multi_Nov2023/count/sample_filtered_feature_bc_matrix/barcodes.tsv.gz B12_barcodes.tsv.gz


B. To change suffix on barcodes this was done:

less B1_barcodes.tsv.gz | sed 's/-1/-1/g' > B1_barcodes.tsv.bk
less B2_barcodes.tsv.gz | sed 's/-1/-2/g' > B2_barcodes.tsv.bk
less B3_barcodes.tsv.gz | sed 's/-1/-3/g' > B3_barcodes.tsv.bk
less B4_barcodes.tsv.gz | sed 's/-1/-4/g' > B4_barcodes.tsv.bk
less B5_barcodes.tsv.gz | sed 's/-1/-5/g' > B5_barcodes.tsv.bk
less B6_barcodes.tsv.gz | sed 's/-1/-6/g' > B6_barcodes.tsv.bk
less B7_barcodes.tsv.gz | sed 's/-1/-7/g' > B7_barcodes.tsv.bk
less B8_barcodes.tsv.gz | sed 's/-1/-8/g' > B8_barcodes.tsv.bk
less B10_barcodes.tsv.gz | sed 's/-1/-10/g' > B10_barcodes.tsv.bk
less B11_barcodes.tsv.gz | sed 's/-1/-11/g' > B11_barcodes.tsv.bk
less B12_barcodes.tsv.gz | sed 's/-1/-12/g' > B12_barcodes.tsv.bk


C. Concatenate barcodes

cat "B1_barcodes.tsv.bk" "B2_barcodes.tsv.bk" "B3_barcodes.tsv.bk" "B4_barcodes.tsv.bk" "B5_barcodes.tsv.bk" "B6_barcodes.tsv.bk" "B7_barcodes.tsv.bk" "B8_barcodes.tsv.bk" "B10_barcodes.tsv.bk" "B11_barcodes.tsv.bk" "B12_barcodes.tsv.bk" > "merged_barcodes.tsv.gz"

##End.