prepexample <-function(){
  if(dir.exists("example")){
    print("WARNING: A folder named example already exists. Files will be overwritten")
    setwd(paste0(getwd(),"/example"))
  }
  else{
    dir.create("example")
    setwd(paste0(getwd(),"/example"))
  }
  tmin_exdata <- "https://geodata.ucdavis.edu/cmip6/10m/HadGEM3-GC31-LL/ssp126/wc2.1_10m_tmin_HadGEM3-GC31-LL_ssp126_2021-2040.tif"
  tmax_exdata <- "https://geodata.ucdavis.edu/cmip6/10m/HadGEM3-GC31-LL/ssp126/wc2.1_10m_tmax_HadGEM3-GC31-LL_ssp126_2021-2040.tif"
  prec_exdata <- "https://geodata.ucdavis.edu/cmip6/10m/HadGEM3-GC31-LL/ssp126/wc2.1_10m_prec_HadGEM3-GC31-LL_ssp126_2021-2040.tif"
  download.file(tmin_exdata,paste0(getwd(),"/wc2.1_10m_tmin_HadGEM3-GC31-LL_ssp126_2021-2040.tif"),mode="wb")
  download.file(tmax_exdata,paste0(getwd(),"/wc2.1_10m_tmax_HadGEM3-GC31-LL_ssp126_2021-2040.tif"),mode="wb")
  download.file(prec_exdata,paste0(getwd(),"/wc2.1_10m_prec_HadGEM3-GC31-LL_ssp126_2021-2040.tif"),mode="wb")
  print("Example data successfully prepared!")
  print(paste0("WorkingDirectory changed to: ",getwd()))
}
