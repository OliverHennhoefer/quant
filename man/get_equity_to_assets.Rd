% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_equity_to_assets.R
\name{get_equity_to_assets}
\alias{get_equity_to_assets}
\title{Get Equity-to-Total-Assets Ratio}
\usage{
get_equity_to_assets(df)
}
\arguments{
\item{df}{data.frame. Data frame with column 'symbol' containing at least one
valid stock ticker symbol.}
}
\value{
The original data.frame supplemented by the company's
\strong{Equity-to-Total-Assets Ratio} of the last five fiscal years plus current
years TTM.
}
\description{
Wrapper function for fetching data from
\href{https://www.gurufocus.com/term/equity2asset/AAPL/}{gurufocus.com}.
}
\details{
The Asset-Turnover-Ratio measures the amount of equity the business or farm
has when compared to the total assets owned by the business or farm. To
determine the Equity-To-Asset ratio you divide the Net Worth by the Total
Assets. This ratio is measured as a percentage.
}
