% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/conversions.R
\name{to_composition_matrix}
\alias{to_composition_matrix}
\title{#' to_composition
#'
#' This function is currently not used by any function in DivNet and is slated for removal}
\usage{
to_composition_matrix(Y, base = NULL)
}
\arguments{
\item{Y}{A matrix of logratios. The samples are listed across the rows and the taxa are listed across the columns}

\item{base}{base taxon used to calculate logratios}
}
\description{
#' This function transforms a vector of logratios Y to a composition matrix X
#'
#' @param Y A vector of logratios
#' @param base base taxon used to calculate logratios
#' 
#' @importFrom R.utils insert
#'
#' @export
to_composition <- function(Y, base = NULL) {
  
  stopifnot(!is.array(Y))
  
  if (is.null(base)) base <- (length(Y) + 1)
  
  exp_Y <- exp(Y)
  denominator <- sum(exp_Y) + 1
  # c(exp_Y, 1) / denominator
  
  numerators <- R.utils::insert(exp_Y, ats = base, values = 1)
  numerators / denominator
}
to_composition_matrix
}
\details{
This function transforms a logratio matrix Y to a composition matrix X
}
