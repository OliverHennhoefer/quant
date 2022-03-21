#' @title
#' Get Long-Term Debt to Total Asset Ratio
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/ltd2asset/AAPL/).
#'
#' @usage get_ltd_to_total_assets(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's
#' **Long-Term Debt to Total Asset Ratio** of the last five fiscal years plus
#' current years TTM.
#'
#' @example
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_ltd_to_total_assets(df)
#'
#' @details
#' The Asset-Turnover-Ratio measures the percentage if a company's assets that
#' are financed with loans and financial obligations lasting more than one year.
#' The ratio gives an indication about a company's ability to meet financial
#' requirements for outstanding loans.
#'
#' @export
#'
get_ltd_to_total_assets <- function(df) {

  pfx <- 'ltd2asset'
  url <- 'https://www.gurufocus.com/term/ltd2asset/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
