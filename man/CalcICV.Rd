% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/CalcICV.R
\name{CalcICV}
\alias{CalcICV}
\title{Calculates the ICV of a covariance matrix.}
\usage{
CalcICV(cov.matrix)
}
\arguments{
\item{cov.matrix}{Covariance matrix.}
}
\value{
coefficient of variation of the eigenvalues of a covariance matrix
}
\description{
Calculates the coefficient of variation of the eigenvalues of a covariance matrix, a measure of
integration comparable to the R^2 in correlation matrices.
}
\details{
Warning: CalcEigenVar is strongly preferred and should probably be used in place of this function.
}
\examples{
cov.matrix <- RandomMatrix(10, 1, 1, 10)
CalcICV(cov.matrix)
}
\references{
Shirai, Leila T, and Gabriel Marroig. 2010. "Skull Modularity in Neotropical Marsupials and Monkeys: Size Variation and Evolutionary Constraint and Flexibility." Journal of Experimental Zoology Part B: Molecular and Developmental Evolution 314 B (8): 663-83. doi:10.1002/jez.b.21367.

Porto, Arthur, Leila Teruko Shirai, Felipe Bandoni de Oliveira, and Gabriel Marroig. 2013. "Size Variation, Growth Strategies, and the Evolution of Modularity in the Mammalian Skull." Evolution 67 (July): 3305-22. doi:10.1111/evo.12177.
}
\seealso{
\code{\link{CalcR2}}
}
\author{
Diogo Melo
}
\keyword{covariance}
\keyword{integration}
