#' @export
prepclmdata <- function(xmin=-180,xmax=180,ymin=-90,ymax=90){
if(is.null(xmin))&(is.null(xmax))&(is.null(ymin))&(is.null(ymax)) {
print("No extent given. Proceeding with global coverage")
cropped=0
    }
else{
print(print(paste("Proceeding with extent xmin",xmin,", xmax",xmax,", ymin",ymin,", ymax",ymax)))
cropped=1
e <- as(extent(xmin, xmax, ymin, ymax), 'SpatialPolygons')
crs(e) <- "+proj=longlat +datum=WGS84 +no_defs"
}
  x=1
  prec=list.files(, pattern="prec", recursive = T) #or can specify dir, e.g. filenames=list.files('D:/batdata/test', recursive = T)
  tmin=list.files(, pattern="tmin", recursive = T) #or can specify dir, e.g. filenames=list.files('D:/batdata/test', recursive = T)
  tmax=list.files(, pattern="tmax", recursive = T) #or can specify dir, e.g. filenames=list.files('D:/batdata/test', recursive = T)
  for (x in 1:12){
    if((length(prec)==12)&(length(tmin)==12)&(length(tmax)==12)){
		print(paste("resolving band ", x, " of 12", sep=""))
		if(cropped==0){
			  img <- raster(prec[x])
			  writeRaster(img, paste(getwd(),"/rain",x,".grd",sep=""), overwrite=TRUE)
			  img <- raster(tmin[x])
			  img = img*10
			  writeRaster(img, paste(getwd(),"/tmin",x,".grd",sep=""), overwrite=TRUE)
			  img <- raster(tmax[x])
			  img = img*10
			  writeRaster(img, paste(getwd(),"/tmax",x,".grd",sep=""), overwrite=TRUE)
			  img <- raster(tmax[1])
		}
		else{
			  img <- raster(prec[x])
			  img = crop(img, e)
			  writeRaster(img, paste(getwd(),"/rain",x,".grd",sep=""), overwrite=TRUE)
			  img <- raster(tmin[x])
			  img = crop(img, e)
			  img = img*10
			  writeRaster(img, paste(getwd(),"/tmin",x,".grd",sep=""), overwrite=TRUE)
			  img <- raster(tmax[x])
			  img = crop(img, e)
			  img = img*10
			  writeRaster(img, paste(getwd(),"/tmax",x,".grd",sep=""), overwrite=TRUE)
			  img <- raster(tmax[1])
		}
    } else{
      print(paste("resolving band ", x, " of 12", sep=""))
	  		if(cropped==0){
			  img <- raster(prec, band=x)
			  img = crop(img, e)
			  writeRaster(img, paste(getwd(),"/rain",x,".grd",sep=""), overwrite=TRUE)
			  img <- raster(tmin, band=x)
			  img = crop(img, e)
			  img = img*10
			  writeRaster(img, paste(getwd(),"/tmin",x,".grd",sep=""), overwrite=TRUE)
			  img <- raster(tmax,band = x)
			  img = crop(img, e)
			  img = img*10
			  writeRaster(img, paste(getwd(),"/tmax",x,".grd",sep=""), overwrite=TRUE)
			  img <- raster(tmax,band = 1)
			  }
			else{
			img <- raster(prec, band=x)
			  writeRaster(img, paste(getwd(),"/rain",x,".grd",sep=""), overwrite=TRUE)
			  img <- raster(tmin, band=x)
			  img = img*10
			  writeRaster(img, paste(getwd(),"/tmin",x,".grd",sep=""), overwrite=TRUE)
			  img <- raster(tmax,band = x)
			  img = img*10
			  writeRaster(img, paste(getwd(),"/tmax",x,".grd",sep=""), overwrite=TRUE)
			  img <- raster(tmax,band = 1)
			  }
			 }
	  }
  }
  img[img>-10000] <- 1
  writeRaster(img, paste(getwd(),"/alt.grd",sep=""), overwrite=TRUE)
  return(paste0("Files successfully prepared! Directory for reference: ",getwd()))
}
