filenames<-list.files("/home/", pattern=".shp$")

library(foreach)
library(doMC)
registerDoMC(8)  #change the 8 to your number of CPU cores  

foreach (i=1:length(filenames)) %dopar% {
  filename<-filenames[i]
  shpclip<-"/home/zone.shp"
  path.in<-paste0("/home/", filename)
  path.out<-paste0("/home/", tools::file_path_sans_ext(filename), "_clip.shp")
  system(paste("ogr2ogr", "-clipsrc", shpclip,path.out,  path.in,"-s_srs EPSG:103300 -t_srs EPSG:103300"))
}
