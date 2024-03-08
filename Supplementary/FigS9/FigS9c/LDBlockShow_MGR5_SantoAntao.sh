#!/bin/bash
BIN=path2LDBlockShow/bin/LDBlockShow
DIR=path2WD/ #contains GWAS results and VCF

# MGR5 peak in Santo Antao
$BIN -InVCF ${DIR}107_SantoAntao_GWAS_filtered.vcf.gz -OutPut ${DIR}MGR5_region -Region 5:19656215:24086362 -SeleVar 2 -NoGeneName -NoShowLDist 5000000 -InGWAS ${DIR}107_SantoAntao_GWAS_Mg.txt

BIN2=path2LDBlockShow/bin/ShowLDSVG
$BIN2 -InPreFix ${DIR}MGR5_region -OutPut ${DIR}MGR5_region -ResizeH 10 -NoGeneName -NoShowLDist 5000000 -InGWAS ${DIR}107_SantoAntao_GWAS_Mg.txt