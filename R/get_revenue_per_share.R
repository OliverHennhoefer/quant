#' @title
#' Get Revenue per Share
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/per+share+rev/AAPL/).
#'
#' @usage get_revenue_per_share(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's **Revenue per Share**
#' of the last five fiscal years plus current years TTM.
#'
#' @example
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_revenue_per_share(df)
#'
#' @details
#' The Asset-Turnover-Ratio measures the value of a company's *Revenue* relative
#' to its market capitalization.
#'
#' @export
#'
get_revenue_per_share <- function(df) {

  pfx <- 'rev.ps'
  url <- 'https://www.gurufocus.com/term/per+share+rev/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
