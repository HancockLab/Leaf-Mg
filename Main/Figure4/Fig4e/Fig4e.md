Fig4e
================
Emmanuel Tergemina
2024-03-11

## Load libraries

``` r
library(ggmap)
library(ggrepel)
library(maps)
library(mapproj)
library(plyr)
library(dplyr)
```

## Set map

``` r
Map = c(left = -20, bottom = 32, right = 45, top = 70) #Europe
mapacc <- get_stadiamap(Map, zoom = 5, maptype = c("stamen_toner_background")) #download_map
```

## Import data

``` r
df <- read.table("Fig4e.txt", header = T, sep = '\t')
```

## Plotting

``` r
reorder <- df[order(df$Chr5_21390834, decreasing=FALSE), ]
reorder <- reorder%>%filter(Chr5_21390834!='.')
ggmap(mapacc) +
  labs(x = 'Longitude', y = 'Latitude',color = "chr5:21390834",shape=3) +
  geom_point(data=reorder, aes(x = Longitude,y = Latitude, color = Chr5_21390834),
             size=1,alpha=0.6) +
  scale_color_manual(values = c("0" = "#56B4E9","1" = "red"),labels = c("major", "minor"),) 
```

![](Fig4e_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->
