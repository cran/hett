\name{tlm.control}
\alias{tlm.control}
\title{
Auxiliary for Controlling tlm Fitting
}
\description{
Auxiliary function for fitting \code{tlm} model. Generally only used
when calling \code{tlm}
}
\usage{
tlm.control(epsilon = 1e-07, maxit = 50, trace = FALSE, verboseLev = 1)
}
\arguments{
\item{epsilon}{
positive convergence tolerance value. The iterations converge when
[newlik - oldlik] < epsilon/2
}
\item{maxit}{
integer giving the maximum iterations allowable for the routine
}
\item{trace}{
logical. If \code{TRUE} output is printed to the screen during each iteration
}
\item{verboseLev}{integer. If 1 then print according to \code{trace}. If 2 then print
  random scale effects also.}
}
\value{
  A list with the argument as values
}
\seealso{
\code{\link{tlm}}
}
\author{Julian Taylor}
\examples{

data(mm, package = "hett")
attach(mm)

## change the maximum amount of iterations for the algorithm

fit1 <- tlm(m.marietta ~ CRSP, ~ 1, data = mm, start = list(dof = 3),
estDof = TRUE, control = tlm.control(maxit = 100))

}
\keyword{regression}
\keyword{distribution}
