% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/barp.R
\name{barp}
\alias{barp}
\title{BARP}
\usage{
barp(y, x, dat, census, geo.unit, proportion = "None", cred_int = c(0.025,
  0.975), BSSD = F, nsims = 20, ...)
}
\arguments{
\item{y}{Outcome of interest. Should be a character of the column name containing the variable of interest.}

\item{x}{Prognostic covariates. Should be a vector of column names corresponding to the covariates used to predict the outcome variable of interest.}

\item{dat}{Survey data containing the x and y column names.}

\item{census}{Census data containing the x column names. If the user provides raw census data, BARP will calculate proportions for each unique bin of x covariates. Otherwise, the researcher must calculate bin proportions and indicate the column name that contains the proportions, either as percentages or as raw counts.}

\item{geo.unit}{The column name corresponding to the unit at which outcomes should be aggregated.}

\item{proportion}{The column name corresponding to the proportions for covariate bins in the Census data. If left to the default \code{None} value, BARP assumes raw census data and estimates bin proportions automatically.}

\item{cred_int}{A vector giving the lower and upper bounds on the credible interval for the predictions.}

\item{BSSD}{Calculate bootstrapped standard deviation. Defaults to \code{FALSE} in which case the standard deviation is generated by BART's default.}

\item{nsims}{The number of bootstrap simulations.}

\item{...}{Additional arguments to be passed to bartMachine.}

\item{plot_convergence}{Plot convergence diagnostics calculated by bartMachine. Defaults to \code{TRUE}.}
}
\value{
Returns an object of class ``barp'', containing a list of the following components:
\item{pred.opn}{A \code{data.frame} where each row corresponds to the geographic unit of interest and the columns summarize the predicted outcome and the upper and lower bounds for the given credible interval (\code{cred_int}).}
\item{trees}{A \code{bartMachine} object. See \code{\link{bartMachine}} for details.}
}
\description{
This function uses Bayesian Additive Regression Trees (BART) to extrapolate survey data to a level of geographic aggregation at which the original survey was not sampled to be representative of.
}
\examples{
data("gaymar")
barp <- barp(y = "supp_gaymar",
             x = c("pvote","religcon","age","educ","gXr","stateid","region"),
             dat = svy,
             census = census06,
             geo.unit = "stateid",
             proportion = "n",
             cred_int = c(0.025,0.975))
}
\seealso{
\code{\link{bartMachine}} which this program uses to implement Bayesian Additive Regression Trees.
}
\keyword{BARP}
\keyword{MRP}
\keyword{Mister}
\keyword{P}
\keyword{multilevel}
\keyword{poststratification}
\keyword{regression}
