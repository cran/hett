\name{tscore}
\alias{tscore}
\title{
Score test for heteroscedastic t models
}
\description{
Provides a score test for the location and scale parameters of the
heteroscedastic t regression model. 
}
\usage{
tscore(..., data = NULL, scale = FALSE)
}
\arguments{
\item{...}{
Any number of arguments containing nested model fits from \code{tlm()}
(see Details)
}
\item{data}{
the data used to fit the models involved
}
\item{scale}{
logical. If \code{TRUE} the scale model is tested}
}
\value{
Output containing the hypothesis, the score statistic, degrees of
freedom for the test and the p-value are printed to the screen.  
}
\details{
The user must supply nested models that test, \emph{either}, the scale
or the location component of the model. The model objects \emph{must} be
nested from left to right. Currently there are no traps if the arguments
are not given in this order.

The models must also have either, all fixed degrees of freedom or
estimated degrees of freedom. 
}
\references{
Taylor, J. D. & Verbyla, A. P (2004).
Joint modelling of the location and scale parameters of the \emph{t}-distribution.
\emph{Statistical Modelling}
\bold{4}, 91-112.
}
\seealso{
\code{\link{tlm}}
}
\author{Julian Taylor}
\examples{

data(mm, package = "hett")
attach(mm)
tfit1 <- tlm(m.marietta ~ CRSP, ~ 1, data = mm, start = list(dof = 3),
estDof = TRUE)

tfit2 <- tlm(m.marietta ~ CRSP, ~ CRSP, data = mm, start = list(dof =
3), estDof = TRUE)

tscore(tfit1, tfit2, data = mm, scale = TRUE)
}
\keyword{regression}
\keyword{distribution}
