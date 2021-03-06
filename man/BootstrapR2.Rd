% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/BootstrapRep.R
\name{BootstrapR2}
\alias{BootstrapR2}
\title{R2 confidence intervals by bootstrap resampling}
\usage{
BootstrapR2(ind.data, iterations = 1000, parallel = FALSE)
}
\arguments{
\item{ind.data}{Matrix of residuals or indiviual measurments}

\item{iterations}{Number of resamples to take}

\item{parallel}{if TRUE computations are done in parallel. Some foreach backend must be registered, like doParallel or doMC.}
}
\value{
returns a vector with the R2 for all populations
}
\description{
Random populations are generated by  resampling 
the suplied data or residuals. R2 is calculated on all the
random population's correlation matrices, provinding a distribution based on the original data.
}
\examples{
r2.dist <- BootstrapR2(iris[,1:4], 30)
quantile(r2.dist)
}
\seealso{
\code{\link{BootstrapRep}}, \code{\link{AlphaRep}}
}
\author{
Diogo Melo Guilherme Garcia
}
\keyword{bootstrap}
\keyword{integration}
\keyword{repeatability}
