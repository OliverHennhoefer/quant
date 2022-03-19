#' @title
#' Get Price-Earnings-Growth Ratio
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/turnover/AAPL/).
#'
#' @usage get_peg_ratio(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's
#' **Price-Earnings-Growth Ratio** of the last five fiscal years plus current
#' years TTM.
#'
#' @example
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_peg_ratio(df)
#'
#' @details
#' The Asset-Turnover-Ratio is defined by the Price-to-Earnings Ratio
#' (without NRI) divided by the 5-Year EBITDA growth rate. A PEG Ratio >1 may
#' indicate overvaluation of a stock, whereas as PEG Ratio <1 may indicate
#' undervaluation.
#'
get_peg_ratio <- function(df) {

  pfx <- 'peg'
  url <- 'https://www.gurufocus.com/term/peg/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
