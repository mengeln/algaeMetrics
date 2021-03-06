% Generated by roxygen2 (4.0.1): do not edit by hand
\name{alg.metrics}
\alias{alg.metrics}
\title{Generates all algae metrics}
\usage{
alg.metrics(data)
}
\description{
Returns all metrics for soft algae and diatoms, along with relevant QC metrics
}
\examples{
data(algaeSamples)
preparedData <- taxonInfo(validator(algaeSamples))
alg.metrics(preparedData$cleanData)
}

