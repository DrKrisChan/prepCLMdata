#' Prepares the CLM data
#'
#' @import raster
#'
#' @param xmin westmost longitudinal extent (in decimal degrees). Precede with minus if necessary. Default: -180°
#' @param xmax eastmost longitudinal extent (in decimal degrees). Precede with minus if necessary. Default: 180°
#' @param ymin southmost latitudinal extent (in decimal degrees). Precede with minus if necessary. Default: -90°
#' @param ymax northmost latitudinal extent (in decimal degrees). Precede with minus if necessary. Default: 90°
#'
#' @returns prepared .grd files for DIVA-GIS
#' @export
#'
#' @description
#' Prepares the CLM data for import into DIVA-GIS.  Update Feb 2025: added argument to for temperature data to be divided by 10 (correctTemp=1). CHELSAcruts data will be automatically detected and the correction flag removed.
#'
#' BEFORE USING: ensure that you have either: 1) set your working directory and ran prepexample(), or 2) have downloaded the necessary data in your working directory:
#' - \strong{minimum temperature data} - often labelled tn
#' - \strong{average temperature data} -  often labelled tx
#' - \strong{precipitation data} - often labelled pr
#'
#' IMPORTANT: Make note of the Directory once the instruction completes - you will need to navigate to it to create the CLM file in DIVA-GIS.
#'
#'
#' @examples #prepare CLM data for global coverage. NOTE: if using high resolution data, global coverage this can use a VAST amount of memory and storage space. We recommend the second example if this is the case.
#' prepclmdata()
#'
#' @examples #prepare CLM data for around London/SE England
#' prepclmdata(-1, 1, 50, 52)

prepclmdata <- function(xmin=-180,xmax=180,ymin=-90,ymax=90,correctTemp=1){
  if(length(list.files(, pattern="CHELSAcruts", recursive = T))>0){
    correctTemp=0
  print("CHELSAcruts data detected. Switching to not correct temperature")
  }
  if((is.null(xmin)) | (is.null(xmax)) | (is.null(ymin)) | (is.null(ymax))) {
    print("No extent given. Proceeding with global coverage")
    cropped=0
  }
  else{
    print(paste("Proceeding with extent xmin",xmin,", xmax",xmax,", ymin",ymin,", ymax",ymax))
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
        if(correctTemp==1){img = img*10}
        writeRaster(img, paste(getwd(),"/tmin",x,".grd",sep=""), overwrite=TRUE)
        img <- raster(tmax[x])
        if(correctTemp==1){img = img*10}
        writeRaster(img, paste(getwd(),"/tmax",x,".grd",sep=""), overwrite=TRUE)
      }
      else{
        img <- raster(prec[x])
        img = crop(img, e)
        writeRaster(img, paste(getwd(),"/rain",x,".grd",sep=""), overwrite=TRUE)
        img <- raster(tmin[x])
        img = crop(img, e)
        if(correctTemp==1){img = img*10}
        writeRaster(img, paste(getwd(),"/tmin",x,".grd",sep=""), overwrite=TRUE)
        img <- raster(tmax[x])
        img = crop(img, e)
        if(correctTemp==1){img = img*10}
        writeRaster(img, paste(getwd(),"/tmax",x,".grd",sep=""), overwrite=TRUE)
      }
    } else{
      print(paste("resolving band ", x, " of 12", sep=""))
      if(cropped==0){
        img <- raster(prec, band=x)
        img = crop(img, e)
        writeRaster(img, paste(getwd(),"/rain",x,".grd",sep=""), overwrite=TRUE)
        img <- raster(tmin, band=x)
        img = crop(img, e)
        if(correctTemp==1){img = img*10}
        writeRaster(img, paste(getwd(),"/tmin",x,".grd",sep=""), overwrite=TRUE)
        img <- raster(tmax,band = x)
        img = crop(img, e)
        if(correctTemp==1){img = img*10}
        writeRaster(img, paste(getwd(),"/tmax",x,".grd",sep=""), overwrite=TRUE)
        img <- raster(tmax,band = 1)
      }
      else{
        img <- raster(prec, band=x)
        writeRaster(img, paste(getwd(),"/rain",x,".grd",sep=""), overwrite=TRUE)
        img <- raster(tmin, band=x)
        if(correctTemp==1){img = img*10}
        writeRaster(img, paste(getwd(),"/tmin",x,".grd",sep=""), overwrite=TRUE)
        img <- raster(tmax,band = x)
        if(correctTemp==1){img = img*10}
        writeRaster(img, paste(getwd(),"/tmax",x,".grd",sep=""), overwrite=TRUE)
        img <- raster(tmax,band = 1)
      }
    }
  }
  
  img[img>-10000] <- 1
  writeRaster(img, paste(getwd(),"/alt.grd",sep=""), overwrite=TRUE)
  return(paste0("Files successfully prepared! Directory for reference: ",getwd()))
}
