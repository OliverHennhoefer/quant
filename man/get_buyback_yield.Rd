% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_buyback_yield.R
\name{get_buyback_yield}
\alias{get_buyback_yield}
\title{Get Buyback Yield}
\usage{
get_buyback_yield(df)
}
\arguments{
\item{df}{data.frame. Data frame with column 'symbol' containing at least one
valid stock ticker symbol.}
}
\value{
Input data.frame supplemented by the company's available
\strong{Buyback Yield} data.
}
\description{
Wrapper function for fetching data from
\href{https://www.gurufocus.com/term/buyback_yield/AAPL/}{gurufocus.com}.
}
\details{
The buyback yield gives the repurchased outstanding shares in relation to the
market capitalization. Higher buyback yields may indicate the managements
expectation that the stock is undervalued or its attempt to prevent a hostile
takeover among other reasons.
}
\examples{
df <- data.frame('symbol' = 'AAPL')
res <- get_buyback_yield(df)

}
