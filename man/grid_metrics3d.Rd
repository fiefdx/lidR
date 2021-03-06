% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/grid_metrics3d.r
\name{grid_metrics3d}
\alias{grid_metrics3d}
\title{Voxelize the space and compute metrics for each voxel}
\usage{
grid_metrics3d(las, func, res = 1)
}
\arguments{
\item{las}{An object of class \code{LAS}.}

\item{func}{expression. The function to be applied to each voxel (see also \link{grid_metrics}).}

\item{res}{numeric. The size of the voxels.}
}
\value{
It returns a \code{data.table} containing the metrics for each voxel. The table
has the class \code{lasmetrics3d} enabling easier plotting.
}
\description{
This is a 3D version of \link{grid_metrics}. It creates a 3D matrix of voxels with a given resolution.
It creates a voxel from the cloud of points if there is at least one point in the voxel. For each voxel
the function allows computation of one or several derived metrics in the same way as the \link{grid_metrics}
functions. The function will dispatch the LiDAR data for each voxel in the user's function (see \link{grid_metrics}).
}
\examples{
LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")
lidar = readLAS(LASfile)

# Cloud of points is voxelized with a 3-meter resolution and in each voxel
# the number of points is computed.
grid_metrics3d(lidar, length(Z), 3)

# Cloud of points is voxelized with a 3-meter resolution and in each voxel
# the mean scan angle of points is computed.
grid_metrics3d(lidar, mean(ScanAngle), 3)

\dontrun{
# Define your own metric function
myMetrics = function(i, angle)
{
  ret = list(
     npoints = length(i),
     angle   = mean(angle),
     imean   = mean(i)
   )

   return(ret)
}

voxels = grid_metrics3d(lidar, myMetrics(Intensity, ScanAngle), 3)

plot(voxels, color = "angle")
plot(voxels, color = "imean")
#etc.
}
}
