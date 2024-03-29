% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_cash_to_debt.R
\name{get_cash_to_debt}
\alias{get_cash_to_debt}
\title{Get Cash-Debt-Ratio}
\usage{
get_cash_to_debt(df)
}
\arguments{
\item{df}{data.frame. Data frame with column 'symbol' containing at least one
valid stock ticker symbol.}
}
\value{
Input data.frame supplemented by the company's available
\strong{Cash-Debt-Ratio} data.
}
\description{
Wrapper function for fetching data from
\href{https://www.gurufocus.com/term/turnover/AAPL/}{gurufocus.com}.
}
\details{
The Cash-Debt-Ratio measures a company's cash, cash equivalents, marketable
securities relative to its debt. A Cash-Debt-Ratio greater 1 indicates that a
company can pay off its debt using its cash on hand.

It differs from the Cash-Ratio by focusing on current as well as on
non-current liabilities.
}
\examples{
df <- data.frame('symbol' = 'AAPL')
res <- get_cash_to_debt(df)

}
