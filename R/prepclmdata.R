prepclmdata <- function(){
  x=1
  prec=list.files(, pattern="prec", recursive = T) #or can specify dir, e.g. filenames=list.files('D:/batdata/test', recursive = T)
  tmin=list.files(, pattern="tmin", recursive = T) #or can specify dir, e.g. filenames=list.files('D:/batdata/test', recursive = T)
  tmax=list.files(, pattern="tmax", recursive = T) #or can specify dir, e.g. filenames=list.files('D:/batdata/test', recursive = T)
  for (x in 1:12){
    if((length(prec)==12)&(length(tmin)==12)&(length(tmax)==12)){
      print(paste("resolving band ", x, " of 12", sep=""))
      img <- raster(prec[x])
      writeRaster(img, paste(getwd(),"/rain",x,".grd",sep=""), overwrite=TRUE)
      img <- raster(tmin[x])
      img = img*10
      writeRaster(img, paste(getwd(),"/tmin",x,".grd",sep=""), overwrite=TRUE)
      img <- raster(tmax[x])
      img = img*10
      writeRaster(img, paste(getwd(),"/tmax",x,".grd",sep=""), overwrite=TRUE)
      img <- raster(tmax[1])
    } else{
      print(paste("resolving band ", x, " of 12", sep=""))
      img <- raster(prec, band=x)
      writeRaster(img, paste(getwd(),"/rain",x,".grd",sep=""), overwrite=TRUE)
      img <- raster(tmin, band=x)
      img = img*10
      writeRaster(img, paste(getwd(),"/tmin",x,".grd",sep=""), overwrite=TRUE)
      img <- raster(tmax,band = x)
      img = img*10
      writeRaster(img, paste(getwd(),"/tmax",x,".grd",sep=""), overwrite=TRUE)
      img <- raster(tmax,band = 1)}
  }
  img[img>-10000] <- 1
  writeRaster(img, paste(getwd(),"/alt.grd",sep=""), overwrite=TRUE)
  return(paste0("Files successfully prepared! Directory for reference: ",getwd()))
}
