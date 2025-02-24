#' Download example CLM data
#'
#' @param source Use 1 for WorldClim SSP1-2.6 2021-24 HadGEM3-GC31-LL data (default); 2 for CHELSAcruts 2016 data.
#'
#' @description
#' Downloads example climate data. Update Feb 2025: added unzip function for WorldClim data. Update Dec 2024: as WorldClim servers can be tempremental, an option parameter has been added to download recent meterological data from CHELSAcruts.
#'
#'
#'
#' @returns Prepared example tmin, tmax and precipitation data.
#' @export
#'
#' @examples #Prepare WorldClim global SSP1 data:
#' prepexample()
#'
#' #Prepare CHELSAcruts 2016 data (latest data at time of writing package)
#' prepexample(2)

prepexample <-function(source=1){
  if(dir.exists("example")){
    print("WARNING: A folder named example already exists. Files will be overwritten")
    setwd(paste0(getwd(),"/example"))
  }
  else{
    dir.create("example")
    setwd(paste0(getwd(),"/example"))
  }
  if(source==1){
    temp <- tempfile()
    download.file("https://geodata.ucdavis.edu/climate/worldclim/2_1/base/wc2.1_10m_tmin.zip",temp)
    unzip(temp)
    download.file("https://geodata.ucdavis.edu/climate/worldclim/2_1/base/wc2.1_10m_tmax.zip",temp)
    unzip(temp)
    download.file("https://geodata.ucdavis.edu/climate/worldclim/2_1/base/wc2.1_10m_prec.zip",temp)
    unzip(temp)
    print("WorldClim example data successfully prepared!")
  }
  if(source==2){
    print("WARNING: The CHELSAcruts data requires 3.36GB of free space.")
    for (x in 1:12) {
      print(paste("Preparing month",x, sep=" "))
      tmin_exdata <- paste("https://os.zhdk.cloud.switch.ch/chelsav1/chelsa_cruts/tmin/CHELSAcruts_tmin_",x,"_2016_V.1.0.tif", sep="")
      tmax_exdata <- paste("https://os.zhdk.cloud.switch.ch/chelsav1/chelsa_cruts/tmax/CHELSAcruts_tmax_",x,"_2016_V.1.0.tif", sep="")
      prec_exdata <- paste("https://os.zhdk.cloud.switch.ch/chelsav1/chelsa_cruts/prec/CHELSAcruts_prec_",x,"_2016_V.1.0.tif", sep="")
      download.file(tmin_exdata,paste0(getwd(),"/CHELSAcruts_tmin_",x,"_2016_V.1.0.tif"),mode="wb")
      download.file(tmax_exdata,paste0(getwd(),"/CHELSAcruts_tmax_",x,"_2016_V.1.0.tif"),mode="wb")
      download.file(prec_exdata,paste0(getwd(),"/CHELSAcruts_prec_",x,"_2016_V.1.0.tif"),mode="wb")
    }
    print("Example CHELSAcruts data successfully prepared!")
  }
  print(paste0("WorkingDirectory changed to: ",getwd()))
}
