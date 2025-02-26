# Scripts

## GWAS

### Software required
* VCFtools version 0.1.16
* PLINK version 1.90b6.26
* GEMMA version 0.94


#### Subset VCF

```bash
vcftools --gzvcf vcf.gz --keep list_samples.txt --recode --stdout | gzip -c > susbet.vcf.gz
```

#### Filter VCF

```bash
vcftools --gzvcf susbet.vcf.gz --maf 0.05 --minDP 3 --minGQ 25 --max-missing 0.5 --non-ref-ac 1 --recode --stdout | gzip -c > subset_filtered.vcf.gz

```

#### Generate ped and map files
```bash
vcftools --gzvcf subset_filtered.vcf.gz --plink --out subset_filtered
```

#### Generate bed, nosex, bim, and fam files
```bash
plink --file subset_filtered--make-bed --out subset_filtered
```

Replace in the fam file 6th column (-9) with blues estimates for leaf Mg contents

#### Generate kinship matrix
```bash
gemma -bfile subset_filtered -gk 1 -miss 0.1 -o subset_filtered
```

#### Run LMM in Gemma
```bash 
gemma -bfile subset_filtered -k output/subset_filtered.cXX.txt -lmm 4 -maf 0.05 -miss 0.1 -n 1 -o Mg_blues_lmm
```

#### Run BSLMM in Gemma
```bash
gemma -bfile subset_filtered -bslmm 1 -maf 0.05 -miss 0.1 -n 1 -k output/subset_filtered.cXX.txt -s 10000000 -w 2500000 -o Mg_blues_bslmm1_run_x
```
Run this command ten times with different run numbers (replace x in output with run number)

## Estimate LD with focal SNP

### Software required

* PLINK version 1.90b6.26

After running plink as above, run this command. 
This is an example using as focal SNP chr5:21392702.

```bash
plink --file subset_filtered --ld-snp 5:21392702 --ld-window 99999 --ld-window-kb 1000 --ld-window-r2 0 --out Chr5_21392702 --r2
```


## Visualize LD blocks

### Software required

* LDBlockShow

This is an example for the *RAPTOR1A* region.<br>
After running LMM with GEMMA, extract chromosome, positions and p_values information and save it as Mg_Blues_GWAS.txt.

```bash
mkdir LDblock
BIN=/path2/LDBlockShow
BIN2=/path2/ShowLDSVG
# RAPTOR1A peak
$BIN -InVCF subset_filtered.vcf.gz -OutPut LDblock/chr5_peak_top -Region 5:260000:310000 -SeleVar 2 -NoGeneName -NoShowLDist 2000000 -InGWAS LDblock/Mg_Blues_GWAS.txt 
$BIN2 -InPreFix LDblock/chr5_peak_top -OutPut LDblock/chr5_peak_top -ResizeH 10 -NoGeneName -NoShowLDist 2000000 -InGWAS LDblock/Mg_Blues_GWAS.txt 
```

More information here: https://github.com/BGI-shenzhen/LDBlockShow











