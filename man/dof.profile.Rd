\name{dof.profile}
\alias{dof.profile}
\title{
Internal profile likelihood function 
}
\description{
Internal profile log-likelihood function for \code{tlm} function 
}
\usage{
dof.profile(dof, n, sqResid, orthoI, X, Z)
}
\arguments{
\item{dof}{
degrees freedom value 
}
\item{n}{
number of values in the response vector
}
\item{sqResid}{
squared residuals
}
\item{orthoI}{
orthogonalized scale parameters
}
\item{X}{
design matrix of explanatory variables for the location model  
}
\item{Z}{
design matrix of explanatory variables for the scale model 
}}
\value{
  a profile log-liklehood value
}
\details{
 This function is \emph{not} intended to be directly called by users. 
}
\keyword{internal}
