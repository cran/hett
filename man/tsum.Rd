\name{tsum}
\alias{tsum}
\alias{print.tsum}
\title{Summary function for the scale or location component of a
  heteroscedastic t model}
\description{
Summarizes the location \emph{or} scale components of a heteroscedastic \emph{t} model
}
\usage{

tsum(object, dispersion = NULL, correlation = FALSE,
             symbolic.cor = FALSE, ...)

\method{print}{tsum}(x, digits = max(3, getOption("digits") - 3), symbolic.cor =
      x$symbolic.cor, signif.stars = getOption("show.signif.stars"),
      scale = TRUE, ...)
}
\arguments{
  \item{object}{either the location \emph{or} scale object created by fitting
    a heteroscedastic t object with \code{tlm}}
  \item{x}{an object of class "\code{tsum}"}
  \item{dispersion}{1 if summarizing the location model; 2 if
    summarizing the scale model (see Details)} 
  \item{correlation}{logical; if \code{TRUE}, the correlation matrix of the
    estimated parameters is returned and printed.}
  \item{digits}{ the number of significant digits to be printed.}
  \item{symbolic.cor}{logical. If \code{TRUE}, print the correlations in
    a symbolic form (see `symnum') rather than as numbers.}
  \item{signif.stars}{logical. if \code{TRUE}, "significance stars" are
    printed for each coefficient.}
  \item{scale}{logical. If \code{TRUE} then the dispersion is known in
    advance (2), and is printed accordingly.}  
  \item{\dots}{further arguments passed to or from other methods.}
}
\details{The argument supplied to \code{dispersion} must be either 1
  (location model) or 2 (scale model). The reason for this is because
  the fitting of the model has already
  scaled the covariance matrix for the location coefficients. Hence the
  scaled and unscaled versions of covariance matrix for the location
  model are identical.     
  
  This function will not be generally called by the user as it
  will only summarize the location or scale model but not both. Instead
  the user should refer to \code{summary.tlm} to print a summary of both models.
}
\value{
  \code{tsum} returns an object of class "\code{tsum}", a list
     with components

\item{call}{the component from \code{object}}
\item{df.residual}{the component from \code{object}}
\item{coefficients}{the matrix of coefficients, standard errors, z-values and
  p-values}
\item{dispersion}{the supplied dispersion argument}
\item{df}{a 2-vector of the rank of the model and the number of
          residual degrees of freedom}
\item{cov.unscaled}{the unscaled (\code{dispersion = 1}) estimated covariance
	    matrix of the estimated coefficients}
\item{cov.scaled}{ditto, scaled by \code{dispersion}}
\item{correlation}{ (only if \code{correlation} is true.)  The estimated
          correlations of the estimated coefficients}
\item{symbolic.cor}{(only if \code{correlation} is true.)  The value of the
          argument \code{symbolic.cor}}
      }
\seealso{\code{\link{summary.tlm}}, \code{\link{tlm}}}
\author{Julian Taylor}      
\examples{

data(mm, package = "hett")
attach(mm)
tfit <- tlm(m.marietta ~ CRSP, ~ CRSP, data = mm, start = list(dof = 3),
estDof = TRUE) 
tsum(tfit$loc.fit, dispersion = 1) 
}
\keyword{regression}
\keyword{distribution}
