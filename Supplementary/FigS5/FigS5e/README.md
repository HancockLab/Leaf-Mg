# Fig.S5e

get_stadiamap requires you to register before creating the map. This is causing trouble when generating the R markdown so I am doing like this until I can find a solution.

### Load libraries
```r
library(ggmap)
library(ggrepel)
library(maps)
library(mapproj)
library(plyr)
library(dplyr)
```

### Load map
```r
Map = c(left = -20, bottom = 32, right = 45, top = 70) #Europe
mapacc = get_stadiamap(Map, zoom = 5, maptype = c("stamen_toner_background")) #download_map
```

### Load data
```r
df = read.table("690_Mg_blues_top3SNPs_wCoordinates.txt", header = T, sep = '\t')
```

### Generate map
```r
cm=1/2.54
PDF=paste("FigS5e.pdf", sep = "")
pdf(PDF,width=15*cm, height = 8*cm)
reorder <- df[order(df$chr5_282011, decreasing=TRUE), ]
reorder=reorder%>%filter(chr5_282011!='.')
ggmap(mapacc) +
  labs(x = 'Longitude', y = 'Latitude',color = "chr5:282011",shape=3) +
  geom_point(data=reorder, aes(x = Longitude,y = Latitude, color = chr5_282011),
             size=1,alpha=0.6) +
  scale_color_manual(values = c("1" = "#56B4E9","0" = "red"),labels = c("derived", "ancestral"),) 
dev.off()
```
