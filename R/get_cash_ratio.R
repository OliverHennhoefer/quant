#' @title
#' Get Cash-Ratio
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/cash_ratio/AAPL/).
#'
#' @usage get_cash_ratio(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's **Cash-Ratio**
#' of the last five fiscal years plus current years TTM.
#'
#' @example
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_cash_ratio(df)
#'
#' @details
#' The Asset-Turnover-Ratio measures the value of a company's cash, cash
#' equivalents, marketable securities relative to its current liabilities. The
#' ratio indicates how liquid a company is.
#'
#' It differs from the Cash-to-Debt-Ratio by focusing on current liabilities due
#' in the short-term (< 1 year).
#'
get_cash_ratio <- function(df) {

  pfx <- 'cash.ratio'
  url <- 'https://www.gurufocus.com/term/cash_ratio/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
