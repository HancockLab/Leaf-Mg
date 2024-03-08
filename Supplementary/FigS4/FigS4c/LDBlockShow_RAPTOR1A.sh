#!/bin/bash
BIN=path2LDBlockShow/bin/LDBlockShow
DIR=path2WD/ #contains GWAS results and VCF

# RAPTRO1A peak
$BIN -InVCF ${DIR}843_Eurasia_GWAS_Ionomics_filtered.vcf.gz -OutPut ${DIR}chr5_peak_top -Region 5:260000:310000 -SeleVar 2 -NoGeneName -NoShowLDist 2000000 -InGWAS ${DIR}843_Eurasia_Mg_GWAS.txt 

BIN2=path2LDBlockShow/bin/ShowLDSVG
$BIN2 -InPreFix ${DIR}chr5_peak_top -OutPut ${DIR}chr5_peak_top -ResizeH 10 -NoGeneName -NoShowLDist 2000000 -InGWAS ${DIR}843_Eurasia_Mg_GWAS.txt 