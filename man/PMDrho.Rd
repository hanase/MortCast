% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MortCast-data.R
\docType{data}
\name{PMDrho}
\alias{PMDrho}
\alias{RhoFemales}
\alias{RhoMales}
\title{Pattern Mortality Decline Lookup Tables}
\format{
Using \code{data(PMDrho)} loads two objects into memory: \code{RhoFemales} and
    \code{RhoMales}. They both are data frames with 22 rows corresponding to age groups, 
    and 17 columns corresponding to different levels of life expectancy in 5-years intervals 
    (from 50 to 135). The names of the columns reflect the middle of the respective interval.
}
\usage{
data(PMDrho)
}
\description{
Data object containing two tables with \eqn{\rho} coefficients for the 
Pattern Mortality Decline method as implemented in the \code{\link{pmd}} function.
}
\examples{
data(PMDrho)
head(RhoFemales)
head(RhoMales)

# plot a few male patterns
e0lev <- colnames(RhoMales)[c(1, 5, 9, 13, 17)]
plot(RhoMales[, e0lev[1]], type="l", log="y", ylim=range(RhoMales[,e0lev]),
    ylab="male rho", xlab="Age")
for(i in 2:length(e0lev)) lines(RhoMales[,e0lev[i]], lty = i)
legend("bottomleft", legend = e0lev, lty = 1:length(e0lev), bty= "n")


}
\references{
Andreev, K. Gu, D., Gerland, P. (2013). Age Patterns of Mortality Improvement by Level of Life Expectancy at Birth with Applications to Mortality Projections. Paper presented at the Annual Meeting
of the Population Association of America, New Orleans, LA. \url{http://paa2013.princeton.edu/papers/132554}.

Gu, D., Pelletier, F. and Sawyer, C. (2017). Projecting Age-sex-specific Mortality: A Comparison of the Modified Lee-Carter and Pattern of Mortality Decline Methods, UN Population Division, 
Technical Paper No. 6. New York: United Nations. \url{https://population.un.org/wpp/Publications/Files/WPP2017_TechnicalPaperNo6.pdf}
}
\seealso{
\code{\link{pmd}}
}
\keyword{datasets}
