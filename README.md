![CRAN](https://img.shields.io/badge/CRAN-1.0.2-brightgreen.svg)  ![Github](https://img.shields.io/badge/Github-1.0.2-green.svg) ![Devel](https://img.shields.io/badge/devel-1.1.0.dev-yellowgreen.svg) ![licence](https://img.shields.io/badge/Licence-GPL--3-blue.svg)

R package for Airborne LiDAR Data Manipulation and Visualization for Forestry Applications

The lidR package provides functions to read and write `.las` and `.laz` files, plot a point cloud, compute metrics using an area-based approach, compute digital canopy models, thin lidar data, manage a catalog of datasets, automatically extract ground inventories, process a set of tiles in multicore, classify data from shapefiles, and provides other tools to manipulate LiDAR data. The lidR package is designed mainly for research purposes using an area-based approach.

lidR provides an open-source and R-based implementation of several classical functions used in software dedicated to LiDAR data manipulation. lidR is flexible because it allows the user to program their own tools and manipulate their own objects in R rather than rely on a set of predefined tools.

Please contact the author for bug reports or feature requests (on github, preferably). I enjoy implementing new features!

1. [Features](#features)
2. [Install lidR from github](#install-lidr-from-github)
3. [Some examples](#some-examples)
4. [Changelog](#changelog)

# Features (not exhaustive)

- [Read write .las and .laz files](https://github.com/Jean-Romain/lidR/wiki/readLAS)
- [Plot 3D LiDAR data](https://github.com/Jean-Romain/lidR/wiki/lasplot)
- [Retrieve indiviual pulses and flightlines](https://github.com/Jean-Romain/lidR/wiki/readLAS#dynamically-computed-fields)
- [Compute any set of metrics using an area based approach](https://github.com/Jean-Romain/lidR/wiki/grid_metrics)
- [Compute any set of metrics on a cloud of points](https://github.com/Jean-Romain/lidR/wiki/cloud_metrics)
- [Classify and clip data from geographic shapefiles](https://github.com/Jean-Romain/lidR/wiki/lasclassify)
- [Colorize a point cloud from RGB images](https://github.com/Jean-Romain/lidR/wiki/lasclassify)
- [Filter a cloud of points based on any condition test](https://github.com/Jean-Romain/lidR/wiki/lasfilter)
- [Clip data based on discs, rectangles or polygons](https://github.com/Jean-Romain/lidR/wiki/lasclip)
- [Manage a catalog of `.las` tiles](https://github.com/Jean-Romain/lidR/wiki/catalog)
- [Thin a point cloud to reach a homogeneous pulse density](https://github.com/Jean-Romain/lidR/wiki/lasdecimate)
- [Automatically extract a set of ground plot inventories](https://github.com/Jean-Romain/lidR/wiki/catalog_queries)
- [Analyse a full set of tiles in parallel computing](https://github.com/Jean-Romain/lidR/wiki/catalog_#process-all-the-file-of-a-catalog_apply)
- [Compute a digital canopy model (DCM)](https://github.com/Jean-Romain/lidR/wiki/grid_canopy)
- [Compute a digital terrain model (DTM)](https://github.com/Jean-Romain/lidR/wiki/grid_terrain)
- [Normalize a point cloud substracting a DTM](https://github.com/Jean-Romain/lidR/wiki/lasnormalize)
- Individual tree segmentation

# Install `lidR`

* The latest released version from CRAN with

```r
install.packages("lidR")
```

* The latest development version from github with

```r
devtools::install_github("Jean-Romain/rlas", dependencies=TRUE)
devtools::install_github("Jean-Romain/lidR", dependencies=TRUE)
```

To install the package from github make sure you have a working development environment.

* **Windows**: Install [Rtools.exe](https://cran.r-project.org/bin/windows/Rtools/).  
* **Mac**: Install `Xcode` from the Mac App Store.
* **Linux**: Install the R development package, usually called `r-devel` or `r-base-dev`
    
# Some examples

![](https://raw.githubusercontent.com/Jean-Romain/lidR/gh-pages/images/examplereadme.png)

# Changelog

### v1.1.0

* New: `lastree()` for individual tree segmentation.
* New: `readLAS()` gains a parameter `filter` from `rlas (>= 1.1.0)`
* Change: `roi_queries()` relies on `rlas (>= 1.1.0)` enabling to use streaming filters. This way it saves a lot a memory and it is much more faster.
* Change: `roi_queries()` lost the parameter `...` all the field are loaded by default.
* Change: `colorPalette` parameter in `plot.LAS()` expect now a list of colors instead of a function. Use `height.colors(50)` instead  of `height.colors`
* Change: in `lasterrain()` the method called `akima` is now called `delaunay` because it corresponds to what is actually computed. Function loosed its parameter `linear`.
* Fix: the header of `LAS` objects automatically updates `Number of point records` and `Number of nth return`.

### v1.0.1

* Change: split the package in two parts. 'lidR' rely on 'rlas' to read binary files.
