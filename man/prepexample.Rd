\name{prepexample}
\alias{prepexample}
\title{Prepare example data}
\usage{
prepexample()
}
\description{
Downloads example data for a particular future climate scenario (Shared Socioeconomic Pathway 1 (a low GHG emission scenario) with radiative forcing of 2.6W/m^2 for 2021-2024 from HadGEM3-GC31-LL). Data is downloaded from UC Davis / WorldClim.org. Exact data download URLs are provided when running the code.
}
\examples{
#We recommend creating a working directory for the data
setwd("C:\YourWorkingDirectory")

#Download the example data to an 'example' directory within your original working directory
prepexample()
}
