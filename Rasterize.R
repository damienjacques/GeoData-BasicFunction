library(raster)

raster_ref<-raster("/user/reference.tif")

ext<-"5000 21000 295200 245000"
# ext<-extent(raster_ref)
# ext<-paste(ext[1], ext[3], ext[2], ext[4])

res<-paste(res(raster_ref)[1], res(raster_ref)[2])

path.in<-"/user/Vector.shp"
path.out<-"/user/Raster.tif"

attribute<-"ID"

command<-'gdal_rasterize'
command<-paste(command, "--config GDAL_CACHEMAX 2000") #Speed-up with more cache (avice: max 1/3 of your total RAM)
command<-paste(command, "-a", attribute) #Identifies an attribute field on the features to be used for a burn in value. The value will be burned into all output bands.
command<-paste(command, "-te", ext) #(GDAL >= 1.8.0) set georeferenced extents. The values must be expressed in georeferenced units. If not specified, the extent of the output file will be the extent of the vector layers.
command<-paste(command, "-tr", res) #(GDAL >= 1.8.0) set target resolution. The values must be expressed in georeferenced units. Both must be positive values.
command<-paste(command, "-ot Int32")
command<-paste(command, path.in)
command<-paste(command, path.out)

system(command)
