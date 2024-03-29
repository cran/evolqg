#' L Modularity
#'
#' Calculates the L-Modularity (Newman-type modularity) and the partition of traits that minimizes L-Modularity. Wrapper for using correlations matrices in community detection algorithms from igraph.
#'
#' Warning: Using modularity maximization is almost always a terrible idea. See: https://skewed.de/tiago/blog/modularity-harmful
#'
#' @param cor.matrix correlation matrix
#' @param method community detection function
#' @param ... Additional arguments to igraph community detection function
#' @note Community detection is done by transforming the correlation matrix into a weighted graph and using community detection algorithms on this graph. Default method is optimal but slow. See igraph documentation for other options.
#'
#' If negative correlations are present, the square of the correlation matrix is used as weights.
#' @return List with L-Modularity value and trait partition
#' @export
#' @importFrom igraph graph.adjacency optimal.community
#' @references Modularity and community structure in networks (2006) M. E. J. Newman,  8577-8582, doi: 10.1073/pnas.0601602103
#' @examples
#'\dontrun{
#' # A modular matrix:
#' modules = matrix(c(rep(c(1, 0, 0), each = 5),
#' rep(c(0, 1, 0), each = 5),
#' rep(c(0, 0, 1), each = 5)), 15)
#' cor.hypot = CreateHypotMatrix(modules)[[4]]
#' hypot.mask = matrix(as.logical(cor.hypot), 15, 15)
#' mod.cor = matrix(NA, 15, 15)
#' mod.cor[ hypot.mask] = runif(length(mod.cor[ hypot.mask]), 0.8, 0.9) # within-modules
#' mod.cor[!hypot.mask] = runif(length(mod.cor[!hypot.mask]), 0.3, 0.4) # between-modules
#' diag(mod.cor) = 1
#' mod.cor = (mod.cor + t(mod.cor))/2 # correlation matrices should be symmetric
#'
#' # requires a custom igraph installation with GLPK installed in the system
#' LModularity(mod.cor)}
LModularity <- function(cor.matrix, method = optimal.community, ...){
  warning("Only use the LModularity function if you know what you are doing.\nIt should not be used in serious applications.\nSee help for references.")
  if(any(cor.matrix < 0)){
    warning("Some correlations are negative. Using squared correlations.")
    cor.matrix = cor.matrix^2
    }
  g = graph.adjacency(cor.matrix, weighted = TRUE, mode = 'undirected')
  comm = method(g, ...)
  modules = unique(comm$membership)
  mod_hypothesis = matrix(0, dim(cor.matrix)[1], length(modules))
  for (mod in modules){
    mod_hypothesis[comm$membership == mod, mod] = 1
  }
  output = list("LModularity" = comm$modularity, "Modularity_hypothesis" = mod_hypothesis)
  return(output)
}
