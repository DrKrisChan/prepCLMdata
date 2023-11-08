# **prepCLMdata**: R package for preparing climate data for Species Niche modelling in DIVA-GIS

This package is designed to prepare climate data (in particular, that from WorldClim) for species niche modelling in DIVA-GIS. 

By merging **monthly temperature (max and min) and/or monthly precipitation data** with **known species niches (optimum growing conditions and absolute limits)** from the FAO's ECOCROP database, DIVA-GIS can calculate the suitability of each grid cell (0-100%). 

Whilst DIVA-GIS already incorporates the ECOCROP model, a very high number of individuals online struggle to prepare climate data for use in the model. This package is designed to overcome that issue. It has been specifically designed for use with [UC Davis' WorldClim data](https://www.worldclim.org/), which comprises current, historic, and future climate data. The tool can however be on your own data (see note below).

# Installation
If you haven't installed R's devtools package, do so now. You will need this to download and activate packages from GitHub:
```r
install.packages("devtools")
```

Activate devtools:
```r
library(devtools)
```

Install the prepCLMdata package:
```r
install_github("DrKrisChan/prepclmdata")
```

Finally, make sure the library is activated:
```r
library(prepclmdata)
```

# Instructions

1. **set the working directory** where the climate data can/will be located:
```r
setwd("C:/MyWorkingDirectory")
```

2. **Using the example data (skip to 3 if using your own data):**
You can automatically download example data for use using:
```r
prepexample()
```
Note that this will create an **example folder** in the current working directory where the data is downloaded. The working directory is then set to this example folder.

More detail about the example data can be found by searching ??prepexample

3. **Check the data:**
It is first worthwhile checking that a valid 1) minimum temperature; 2) maximum temperature, and; 3) precipitation dataset are in the working directory. 

If a precipitation dataset is not required, you can copy one of the temperature datasets, being careful to rename the "tmin" part of the file name to "prec"
```r
checkfiles()
```

4. **Prepare the CLM data:**
Finally, prepare the CLM data for use in DIVA-GIS using:
```r
prepclmdata()
```

**Make note of the directory once the instruction completes** - you will need to navigate to it to create the CLM file in DIVA-GIS.

# After: Importing the data in DIVA-GIS

To import and use the climate data in DIVA-GIS:
1. Navigate to **Data > Climate > Make CLM files**
2. Navigate to your data directory (the final output after running prepclmdata()) and **double-click the folder**. The list of .grd files should now show in the top-middle panel.
3. Ensure that the 'File prefixes' are correctly set (i.e. tmin, tmax, rain) and **REMOVE any Suffix**. Ensure the 'Make Index' checkbox is ticked.
4. **Click Files**. The files should populate in their respective parameters below.
5. **Click OK**.
6. After the process is complete, click **Close**.
7. Navigate to **Tools > Options**
8. Navigate to the same folder where your .grd data was stored then **click OK**.
9. enter **"climate"** without quotation marks in the box below.
10. Click **Apply** (metadata of the climate data should appear) then OK.
11. You are finally free to **commence the species niche modelling:**
12. Navigate to **Modeling > Ecocrop**. 
13. **Select your species** then click the **Predict tab**.
14. Enter **extent coordinates** (setting for full globe: MinX: -180; MinY: -90; MaxX: 180; MaxY:90)
15. Next to 'climate Database' **click climate from the dropdown**
16. Set an **Output location** and your choice of model runs.
17. Click **Apply** then OK.
18. A .grd file will be created. You can **export this via Data > Export Gridfile > Single File**. If purely for visualisation, we recommend using Google Earth .KMZ, otherwise we recommend using ESRI ASCII for importing onto QGIS, ARCGIS or other GIS systems.

## Using your own climate data

Though the data is designed for use with WorldClim data, it can be used with your own data. To do so, you will need to export a monthly .tif layer stack for 1) minimum temperature (degrees celcius÷10; requires tmin in name), 2) maximum temperature (degrees celcius÷10; requires tmax in name), and 3) rainfall (mm; requires prec in name). Note that as WorldClim temperature data is scaled at 10x (i.e. pixel values of 1 actually represent 10 degrees Celcius), true temperature data must first be divided by 10.

## Version amendments

0.1.1: Added the ability to check and prepare data where each month is a separate file (as is the case with historical/'near current' climate data)

# Found the package useful?

Please [let us know how you're using the tool](https://forms.office.com/e/KPkkmMnu8s)

Please also consider [buying me a coffee](https://ko-fi.com/krischan)

# Package website

For further info and updates, visit: [https://github.com/DrKrisChan/prepCLMdata](https://github.com/DrKrisChan/prepCLMdata)

For suggestions or bug reporting, visit: [https://github.com/DrKrisChan/prepCLMdata/issues](https://github.com/DrKrisChan/prepCLMdata/issues)

# Citation

Please cite as:
**Chan, K. (2023)** prepCLMData R package (Version 0.1.0). Available from: [https://github.com/DrKrisChan/prepCLMdata/issues](https://github.com/DrKrisChan/prepCLMdata/issues)
