% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/other_methods.R
\name{logquad}
\alias{logquad}
\alias{logquadj}
\title{Log-Quadratic Mortality Model}
\usage{
logquad(
  e0,
  sex = c("male", "female", "total"),
  my.coefs = NULL,
  q5ranges = c(1e-04, 0.9),
  k = 0,
  keep.lt = FALSE,
  ...
)

logquadj(e0m, e0f, ...)
}
\arguments{
\item{e0}{Vector of target life expectancies.}

\item{sex}{Which sex does the give \code{e0} corresponds to.}

\item{my.coefs}{Data frame with columns \dQuote{sex}, \dQuote{age}, \dQuote{ax}, \dQuote{bx}, \dQuote{cx}, \dQuote{vx}.
The \dQuote{sex} column should contain values \dQuote{female}, \dQuote{male} and/or \dQuote{total}.
The \dQuote{age} column must be sorted so that it assures that rows correspond to ages in increasing order.
Any \code{NA}s are internally converted to zeros. If not given, the dataset \code{\link{LQcoef}} is used.}

\item{q5ranges}{A vector of size two, giving the min and max of 5q0 used in the bisection method.}

\item{k}{Value of the \eqn{k} parameter.}

\item{keep.lt}{Logical. If \code{TRUE} additional life table columns are kept in the 
resulting object.}

\item{\dots}{Additional arguments passed to the underlying function.}

\item{e0m}{A time series of target male life expectancy.}

\item{e0f}{A time series of target female life expectancy.}
}
\value{
Function \code{logquad} returns a list with the following elements: a matrix \code{mx}
    with the predicted mortality rates. If \code{keep.lt} is \code{TRUE}, it also 
    contains matrices \code{sr} (survival rates), and life table quantities \code{Lx} and \code{lx}.
    Function \code{logquadj} returns a list of objects, one for each sex.
}
\description{
Predict age-specific mortality rates using the Log-Quadratic Mortality Model (Wilmoth et al. 2012).
}
\details{
The LogQuad method in this implementation projects mortality rates using the equation
     \deqn{\log(m_x) = a_x + b_x h + c_x h^2 + v_x k}
     where \eqn{a_x}, \eqn{b_x}, \eqn{c_x} and \eqn{v_x} are age-specific coefficients, \eqn{h = \log( 5q0 )} 
     (i.e. reflects child mortality), 
     and \eqn{k} should be chosen to match 45q15 (adult mortality) or set to 0 (default). The coefficients
     can be passed as inputs, or taken from the package default dataset \code{\link{LQcoef}} which 
     are taken from \url{http://www.demog.berkeley.edu/~jrw/LogQuad}.
     
     For the given inputs and values of life expectancy e0, the function finds values of \eqn{h} that 
     best match e0, using life tables and the bisection method. It returns the corresponding mortality schedule
     for each value of e0.
     
     Function \code{logquad} is for one sex, while \code{logquadj} can be used for both sexes.
}
\examples{
data(e0Mproj, package = "wpp2017")
country <- "Brazil"
# get target e0
e0m <- as.numeric(subset(e0Mproj, name == country)[-(1:2)])
# project into future
pred <- logquad(e0m, sex = "male")
# plot first projection in black and the remaining ones in heat colors 
plot(pred$mx[,1], type = "l", log = "y", ylim = range(pred$mx),
    ylab = "male mx", xlab = "Age", main = country)
for(i in 2:ncol(pred$mx)) lines(pred$mx[,i], 
    col = heat.colors(20)[i])
    
}
\references{
Wilmoth, J., Zureick, S., Canudas-Romo, V., Inoue, M., Sawyer, C. (2012). 
     A Flexible Two-Dimensional Mortality Model for Use in Indirect Estimation. 
     Population studies, 66(1), 1-28. \doi{doi:10.1080/00324728.2011.611411}
}
\seealso{
\code{\link{LQcoef}}, \code{\link{mortcast.blend}}, \code{\link{mortcast}}, \code{\link{pmd}}, \code{\link{mlt}}
}
