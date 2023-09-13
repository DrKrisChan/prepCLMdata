checkfiles<-function(){
  prec=list.files(, pattern="prec", recursive = T)
  tmin=list.files(, pattern="tmin", recursive = T)
  tmax=list.files(, pattern="tmax", recursive = T)
  grd=list.files(, pattern=".grd", recursive = T)
  if(length(grd)!=0){warning(paste0(".grd files already found in ",getwd()," Please ensure you are happy to progress as files will be overwritten"))}
  if(length(prec)==0){warning(paste0("no rain file in ",getwd()))}
  else{print(paste0("rain file found: ",prec))}
  if(length(tmin)==0){warning(paste0("no tmin file in ",getwd()))}
  else{print(paste0("tmin file found: ",tmin))}
  if(length(tmax)==0){warning(paste0("no tmax file in ",getwd()))}
  else{print(paste0("tmax file found: ",tmax))}
}
