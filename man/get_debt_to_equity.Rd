% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_debt_to_equity.R
\name{get_debt_to_equity}
\alias{get_debt_to_equity}
\title{Get Debt to Equity Ratio}
\usage{
get_debt_to_equity(df)
}
\arguments{
\item{df}{data.frame. Data frame with column 'symbol' containing at least one
valid stock ticker symbol.}
}
\value{
Input data.frame supplemented by the company's available
\strong{Debt to Equity Ratio} data.
}
\description{
Wrapper function for fetching data from
\href{https://www.gurufocus.com/term/deb2equity/AAPL/}{gurufocus.com}.
}
\details{
The debt-to-equity (D/E) ratio compares a company's total liabilities to its
shareholder equity and can be used to evaluate how much leverage a company is
using. Higher-leverage ratios tend to indicate a company or stock with higher
risk to shareholders.
}
\examples{
df <- data.frame('symbol' = 'AAPL')
res <- get_debt_to_equity(df)

}
