% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_dividend_per_share.R
\name{get_dividend_per_share}
\alias{get_dividend_per_share}
\title{Get Dividend per Share}
\usage{
get_dividend_per_share(df)
}
\arguments{
\item{df}{data.frame. Data frame with column 'symbol' containing at least one
valid stock ticker symbol.}
}
\value{
Input data.frame supplemented by the company's available
\strong{Dividend per Share} data.
}
\description{
Wrapper function for fetching data from
\href{https://www.gurufocus.com/term/Dividends+Per+Share/AAPL/}{gurufocus.com}.
}
\details{
Dividend per share (DPS) is the sum of declared dividends issued by a company
for every ordinary share outstanding. The figure is calculated by dividing
the total dividends paid out by a business, including interim dividends, over
a period of time, usually a year, by the number of outstanding ordinary
shares issued.
}
\examples{
df <- data.frame('symbol' = 'AAPL')
res <- get_dividend_per_share(df)

}
