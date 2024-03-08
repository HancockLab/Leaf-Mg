#!/bin/bash
BIN=path2LDBlockShow/bin/LDBlockShow
DIR=path2WD/ #contains GWAS results and VCF

# MGR5 peak in Europe
$BIN -InVCF ${DIR}843_Eurasia_GWAS_Ionomics_filtered.vcf.gz -OutPut ${DIR}chr5_peak_bottom -Region 5:1380000:21420000 -SeleVar 2 -NoGeneName -NoShowLDist 2000000 -InGWAS ${DIR}843_Eurasia_Mg_GWAS.txt 

BIN2=path2LDBlockShow/bin/ShowLDSVG
$BIN2 -InPreFix ${DIR}chr5_peak_bottom -OutPut ${DIR}chr5_peak_bottom -ResizeH 10 -NoGeneName -NoShowLDist 2000000 -InGWAS ${DIR}843_Eurasia_Mg_GWAS.txt 