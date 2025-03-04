% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/prepexample.R
\name{prepexample}
\alias{prepexample}
\title{Download example CLM data}
\usage{
prepexample(source = 1)
}
\arguments{
\item{source}{Use 1 for WorldClim SSP1-2.6 2021-24 HadGEM3-GC31-LL data (default); 2 for CHELSAcruts 2016 data.}
}
\value{
Prepared example tmin, tmax and precipitation data.
}
\description{
Downloads example climate data. Update Dec 2024: as WorldClim servers can be tempremental, an option parameter has been added to download recent meterological data from CHELSAcruts.
}
\examples{
#Prepare WorldClim global SSP1 data:
prepexample()

#Prepare CHELSAcruts 2016 data (latest data at time of writing package)
prepexample(2)
}
