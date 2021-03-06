% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_piotroski_f_score.R
\name{get_piotroski_f_score}
\alias{get_piotroski_f_score}
\title{Get Piotroski F-Score}
\usage{
get_piotroski_f_score(df)
}
\arguments{
\item{df}{data.frame. Data frame with column 'symbol' containing at least one
valid stock ticker symbol.}
}
\value{
The original data.frame supplemented by the company's \strong{Piotroski F-Score}
of the last five fiscal years plus current years TTM.
}
\description{
Wrapper function for fetching data from
\href{https://www.gurufocus.com/term/turnover/AAPL/}{gurufocus.com}.
}
\details{
The Asset-Turnover-Ratio measures the value of a company's
\emph{Net Sales Revenue} relative to the value of its \emph{Total Assets}. The ratio
indicates how effectively a company is using its assets in order to generate
sales.
}
