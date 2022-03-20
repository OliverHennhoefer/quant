#' @title
#' Get Price-Earnings Ratio without Non-Recurring Items
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/penri/AAPL/).
#'
#' @usage get_pe_ratio_nri(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's
#' **Price Earnings Ratio without Non-Recurring Items** of the last five fiscal
#' years plus current years TTM.
#'
#' @example
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_pe_ratio_nri(df)
#'
#' @details
#' The Asset-Turnover-Ratio gives the price to earnings ratio without the
#' potentially misleading effects if non-recurring items (e.g. sale of a major
#' asset). The ratio only considers regular operating income.
#'
get_pe_ratio_nri <- function(df) {

  pfx <- 'pe_nri'
  url <- 'https://www.gurufocus.com/term/penri/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
