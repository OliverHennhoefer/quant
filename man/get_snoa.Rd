% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_snoa.R
\name{get_snoa}
\alias{get_snoa}
\title{Get Scaled Net Operating Assets}
\usage{
get_snoa(df)
}
\arguments{
\item{df}{data.frame. Data frame with column 'symbol' containing at least one
valid stock ticker symbol.}
}
\value{
Input data.frame supplemented by the company's available
\strong{Scaled Net Operating Assets} data.
}
\description{
Wrapper function for fetching data from
\href{https://www.gurufocus.com/term/SNOA/AAPL/}{gurufocus.com}.
}
\details{
Scaled Net Operating Assets (SNOA) is calculated as the difference between
operating assets and operating liabilities, scaled by lagged total assets.
}
\examples{
df <- data.frame('symbol' = 'AAPL')
res <- get_snoa(df)

}
