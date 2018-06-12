\name{mm}
\alias{mm}
\docType{data}
\title{Excess returns for Martin Marietta company}
\description{
Data from the Martin Marietta company collected overa period of 5 years
on a monthly basis}
\usage{data(mm)}
\format{
  A data frame with 60 observations on the following 4 variables.
  \describe{
    \item{date}{the month the data was collected}
    \item{am.can}{a numeric vector}
    \item{m.marietta}{excess returns from the Martin Marietta company}
    \item{CRSP}{an index for the excess rate returns for the New York
      stock exchange}
  }
}
\source{
  Bulter et al (1990).
  Robust and partly adpative estimation of regression models.
  \emph{Review of Economic Statistics},
  \bold{72}, 321-327.  
}
\examples{

data(mm, package = "hett")
attach(mm)
plot(CRSP, m.marietta)
lines(CRSP, fitted(lm(m.marietta ~ CRSP)), lty = 2)

}
\keyword{datasets}
