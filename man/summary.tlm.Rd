\name{summary.tlm}
\alias{summary.tlm}
\alias{print.summary.tlm}
\title{
summary method for class "tlm"
}
\description{
Summarizes the heteroscedastic \emph{t} regression object
}
\usage{
\method{summary}{tlm}(object, correlation = FALSE, ...)
\method{print}{summary.tlm}(x, ...) 
}
\arguments{
\item{object}{
heteroscedastic t regression object called from \code{tlm()}
}
\item{x}{
an object of class "\code{summary.tlm}" containing the values below
}
\item{correlation}{
should the calaculation of the parameter correlation matrix be
supressed. If the fit includes a location and a scale formula then both
correlation matrices are printed. The default is \code{FALSE}.  
} 
\item{\dots}{
arguments passed to or from other methods
}
}
\value{
a list containing the following components:

\item{loc.summary}{
an object containing a list of objects that summarize the location model
}
\item{scale.summary}{
an object containing a list of objects that summarize the scale model
}
\item{iter}{
the number of iterations of the algorithm
}
\item{dof}{
value of the fixed or estimated degrees of freedom
}
\item{dofse}{
the standard error associated with the degrees of freedom if estimated
}
\item{logLik}{
the maximised log-likelihood   
}
\item{method}{
the method used to maximize the likelihood  
}
\item{endTime}{
the time taken for the algorithm to converge
}}
\details{  
The table summary produced by this function should be used with
caution. A more appropriate test between nested models is to use the
score statistic function \code{tscore}.   
}

\seealso{
\code{\link{tsum}}, \code{\link{tlm}}
}
\examples{

data(mm, package = "hett")
attach(mm)

## fit a model with heteroscedasticity and estimating the degrees of freedom

tfit2 <- tlm(m.marietta ~ CRSP, ~ CRSP, data = mm, start = list(dof =
3), estDof = TRUE)
summary(tfit2) 
}
\keyword{regression}
\keyword{distribution}
