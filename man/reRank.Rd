% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/9-deprecated.R
\name{reRank}
\alias{reRank}
\title{Serialize "1 vs. all" Feature Selection}
\usage{
reRank(fss)
}
\arguments{
\item{fss}{The result of a \code{doMulti} function call.}
}
\value{
A vector of re-ranked features. See Details.
}
\description{
This experimental function converts multiple feature rank lists,
 derived from "1 vs. all" binary feature selection, into a single
 feature rank list. This function is not in use in this package.
}
\details{
After passing a feature selection method through \code{doMulti},
 a set of ranked features gets returned for each one of the
 total number of levels in the \code{$defineCase} factor. In
 order to proceed with model deployment (at least in the setting
 of a conventional pipeline where feature selection occurs
 prior to classifier construction), multiple feature rankings
 would need to get serialized into a single feature rank list.
 \code{reRank} accomplishes this by calculating the rank sum
 for each feature across all "1 vs. all" feature selection
 tasks. Features found in one rank list but not in another
 receive a numeric rank equal to one more than the maximum rank
 in that feature rank list. The presence of a NA placeholder
 (see: \code{\link{doMulti}}) will not impact \code{reRank}.

We note here, however, that a better approach would deploy
 "1 vs. all" feature selection and classifier construction
 simultaneously, rather than "1 vs. all" feature selection
 followed by "1 vs. all" classifier construction. This is
 now implemented as \code{\link{plGridMulti}}.
}
