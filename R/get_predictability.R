#' @title
#' Get Predictability Rank
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/predictability_rank/AAPL/).
#'
#' @usage get_predictability(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's **Predictability Rank**
#' of the last five fiscal years plus current years TTM.
#'
#' @example
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_predictability(df)
#'
#' @details
#' Gurufocus.com ranks the predictability of companies based on the consistency
#' of their revenue per share and EBITDA (earning before interest, tax,
#' depreciation and amortization) per share over the past ten fiscal years, and
#' study the correlation between the stock performances and the predictability
#' of the business.
#'
get_predictability <- function(df) {

  url <- 'https://www.gurufocus.com/term/predictability_rank/'
  xpath_txt <- '//*[@id="target_def_description"]/div/span'

  res <- suppressWarnings(scrape_predictability(df, url, xpath_txt))

  return(res)
}
