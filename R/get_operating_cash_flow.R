#' @title
#' Get Operating Cash Flow per Share
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/turnover/AAPL/).
#'
#' @usage get_operating_cash_flow(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's
#' **Operating Cash Flow per Share** of the last five fiscal years plus current
#' years TTM.
#'
#' @example
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_operating_cash_flow(df)
#'
#' @details
#' The Asset-Turnover-Ratio measures the value of a company's
#' *Net Sales Revenue* relative to the value of its *Total Assets*. The ratio
#' indicates how effectively a company is using its assets in order to generate
#' sales.
#'
get_operating_cash_flow <- function(df) {

  pfx <- 'ocf'
  url <- 'https://www.gurufocus.com/term/Cash_Flow_from_Operations_per_share/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
