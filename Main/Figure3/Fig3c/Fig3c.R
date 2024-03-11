library(ggplot2)
library(ggmap)
library(ggrepel)
library(maps)
library(mapproj)
library(plyr)
library(dplyr)

Map = c(left = -20, bottom = 32, right = 45, top = 70) #Europe
mapacc <- get_stadiamap(Map, zoom = 5, maptype = c("stamen_toner_background")) #download_map


df <- read.table("Fig3c.txt", header = T, sep = '\t')
cm=1/2.54
PDF=paste("Fig3c.pdf", sep = "")
pdf(PDF,width=15*cm, height = 8*cm)
reorder <- df[order(df$Chr5_282011, decreasing=TRUE), ]
reorder <- reorder%>%filter(Chr5_282011!='.')
ggmap(mapacc) +
  labs(x = 'Longitude', y = 'Latitude',color = "Chr5:282011",shape=3) +
  geom_point(data=reorder, aes(x = Longitude,y = Latitude, color = Chr5_282011 ),
             size=1,alpha=0.6) +
  scale_color_manual(values = c("1" = "#56B4E9","0" = "red"),labels = c("minor", "major"),)
dev.off()
