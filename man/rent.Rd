\name{rent}
\alias{rent}
\docType{data}
\title{Rent for Land PLanted to Alfalfa}
\description{
Dataset collected in 1977 from Minnesota to study the variation in land
rented for growing alfalfa
}
\usage{data(rent)}
\format{
  A data frame with 67 observations on the following 5 variables.
  \describe{
    \item{Rent}{a numeric vector average rent per acre.}
    \item{AllRent}{a numeric vector describing average rent paid for all tillable land.}
    \item{Cows}{a numeric vector describing the density of dairy cows (number per square mile).}
    \item{Pasture}{a numeric vector describing the proportion of farmland used as pasture.}
    \item{Liming}{a factor with levels \code{No} if no liming is
      required to grow alfalfa and \code{Yes} if it does.}
  }
}
\source{
  Weisberg, S (1985).
  \emph{Applied Linear Regression}
  Wiley: New York
}
\examples{

library(lattice)
data(rent, package = "hett")
attach(rent)
xyplot(log(Rent/AllRent) ~ sqrt(Cows), groups = Liming, panel = panel.superpose) 

}
\keyword{datasets}
