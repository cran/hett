\name{tlm}
\alias{tlm}
\alias{print.tlm}
\title{
Maximum likelihood estimation for heteroscedastic t regression
}
\description{
Fits a heteroscedastic t regression to given data for known and unknown
degrees of freedom.
}
\usage{
tlm(lform, sform =  ~ 1, data = sys.parent(), subset = NULL, contrasts =
    NULL, na.action = na.fail, start = NULL, control = tlm.control(...),
    obs = FALSE, estDof = FALSE, ... )

\method{print}{tlm}(x, ...)
}
\arguments{
\item{x}{
an object of class "\code{tlm}"
}  
\item{lform}{
a formula of the type \code{response ~ terms}, where \code{terms} can
be of the form, for example, \code{first + second} or
\code{first*second}(see \code{lm} for details)   
}
\item{sform}{
a formula of the type \code{~ terms}, where \code{terms} can
be of the form, for example, \code{first + second} or
\code{first*second}(see \code{lm} for details).
}
\item{data}{
the data in the form of a \code{data.frame} where the column names can
be matched to the variable names supplied in \code{lform} and \code{sform} 
}
\item{subset}{
numerical vector to subset the \code{data} argument 
}
\item{contrasts}{
set of contrasts for the location model (see \code{contrasts.arg} for details)
}
\item{na.action}{
the action to proceed with in the event of \code{NA}'s in the
response. Currently \code{NA}'s are not allowed and therefore
\code{na.fail} is the sole argument.  
}
\item{start}{
is a list of possibly four named components, ("\code{beta}",
"\code{lambda}", "\code{dof}", "\code{omega}"), for the location, scale,
degrees of freedom parameters and random scale effects
respectively. Each component must be of the appropriate
length.
}
\item{control}{
is an argument to a function that maintains the control of the
algorithm. The \code{tlm.control()}function contains the arguments,
\code{epsilon} to determine how small the relative difference of
likelihoods should be for convergence (default is 1e-07), \code{maxit}
to determine the maximum iterations required (default = 50),
\code{trace} if the user requires printing of estimates etc. as
algorithm runs (default = \code{FALSE}), \code{verboseLev} to determine
the amount of verbose printing to the screen as the algorithm runs
(verboseLev = 1 displays location scale and dof estimates and the
likelihood, verboseLev = 2 displays all of 1 plus the random scale effects)
}
\item{obs}{
should the location parameters be calculated using the observed or
expected information(default = \code{FALSE}). (Note: using the observed
information does not calculate the appropriate standard errors, see DETAILS) 
}
\item{estDof}{
should the degrees of freedom parameter be estimated or not. If \code{FALSE}
then the value given for \code{dof} in the \code{start} argument
will be the fixed value used for the algorithm. If \code{TRUE} then the
value given for \code{dof} in the \code{start} argument supplies an
initial value only.
}
\item{\dots}{
arguments passed to \code{tlm.control() or to the \code{print} method}
}}
\value{
a list containing the following components:

\item{loc.fit}{
an object containing the estimated location parameters and other
elements associated with the location parameter model 
}
\item{scale.fit}{
an object containing the estimated scale parameters and other
elements associated with the scale parameter model 
}
\item{random}{
the random scale effects
}
\item{dof}{
fixed or estimated degrees of freedom
}
\item{dofse}{
the standard error associated with the degrees of freedom
}
\item{iter}{
the number of iterations of the algorithm
}
\item{logLik}{
the maximised log-likelihood   
}
\item{endTime}{
the time taken for the algorithm to converge
}}
\details{
When the degrees of freedom is unknown the code uses the non-linear optimiser
\code{nlm}. If the data is tending toward the Gaussian this optimisation
will still converge but with with very high degrees of freedom.

To obtain the appropriate standard errors from \code{summary} the user
must specify the argument \code{obs = F} to ensure that the location
parameter is calculated using the expected information component.
}
\section{Background}{
The theoretical background for this function can be found in Taylor and Verbyla (2004)
}
\references{
Taylor, J. D. & Verbyla, A. P (2004).
Joint modelling of the location and scale parameters of the \emph{t}-distribution.
\emph{Statistical Modelling}
\bold{4}, to appear.
}

\seealso{
\code{\link{summary.tlm}}
}
\examples{

data(mm, package = "hett")
attach(mm)

## fit a model with no heteroscedasticity and fixed degrees of freedom

tfit <- tlm(m.marietta ~ CRSP, data = mm, start = list(dof = 3))

## fit a model with heteroscedasticity and fixed degrees of freedom

tfit1 <- tlm(m.marietta ~ CRSP, ~ CRSP, data = mm, start = list(dof = 3))

## fit a model with heteroscedasticity and estimating the degrees of freedom

tfit2 <- tlm(m.marietta ~ CRSP, ~ CRSP, data = mm,
start = list(dof = 3), estDof = TRUE) 
}
\keyword{regression}
\keyword{distribution}
