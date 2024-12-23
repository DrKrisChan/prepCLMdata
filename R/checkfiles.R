#' Checks the min temperature, max tempature and precipitation files in the working directory and whether there are any expected errors.
#'
#' @returns test results
#' @export
#'
#' @examples checkfiles()

checkfiles<-function(){
  precmultiple=FALSE
  tminmultiple=FALSE
  tmaxmultiple=FALSE
  prec=list.files(, pattern="prec", recursive = T) #or can specify dir, e.g. filenames=list.files('D:/batdata/test', recursive = T)
  tmin=list.files(, pattern="tmin", recursive = T) #or can specify dir, e.g. filenames=list.files('D:/batdata/test', recursive = T)
  tmax=list.files(, pattern="tmax", recursive = T) #or can specify dir, e.g. filenames=list.files('D:/batdata/test', recursive = T)
  grd=list.files(, pattern=".grd", recursive = T) #or can specify dir, e.g. filenames=list.files('D:/batdata/test', recursive = T)
  if(length(grd)!=0){warning(paste0(".grd files already found in ",getwd()," Please ensure you are happy to progress as files will be overwritten"))}
  if(length(prec)==0){warning(paste("no rain file in ",getwd()))}
  if((length(prec)>1)&(length(prec)==12)){warning(paste("12 precipitation files found in ",getwd(), ". Assuming individual bands for each month."))}else if((length(prec)>1)&(length(prec)!=12)){warning(paste("multiple precipitation files found in ",getwd(),". Please ensure only one precip file is used in folder (unless individual monthly files are used)."))}
  else{print(paste0("rain file found: ",prec))}
  if(length(tmin)==0){warning(paste("no tmin file in ",getwd()))}
  if((length(tmin)>1)&(length(tmin)==12)){warning(paste("12 tmin files found in ",getwd(), ". Assuming individual bands for each month."))}else if((length(tmin)>1)&(length(tmin)!=12)){warning(paste("multiple tmin files found in ",getwd(),". Please ensure only one tmin file is used in folder (unless individual monthly files are used)."))}
  else{print(paste0("tmin file found: ",tmin))}
  if(length(tmax)==0){warning(paste("no tmax file in ",getwd()))}
  if((length(tmax)>1)&(length(tmax)==12)){warning(paste("12 tmax files found in ",getwd(), ". Assuming individual bands for each month."))}else if((length(tmax)>1)&(length(tmax)!=12)){warning(paste("multiple tmax files found in ",getwd(),". Please ensure only one tmax file is used in folder (unless individual monthly files are used)."))}
  else{print(paste0("tmax file found: ",tmax))}
}
