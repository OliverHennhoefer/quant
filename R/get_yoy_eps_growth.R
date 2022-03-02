#' Get Year-over-Year Earnings per Share Growth
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/growth_per_share_eps/AAPL/).
#'
#' @usage get_yoy_eps_growth(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's
#' **Year-over-Year Earnings per Share Growth** of the last five fiscal years
#' plus current years TTM.
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_yoy_eps_growth(df)
#'
#' @details
#' YoY EPS Growth is the percentage change of Earnings per Share (Diluted) over
#' the past twelve months.
#'
get_yoy_eps_growth <- function(df) {

  pfx <- 'yoy_eps_gwth'
  url <- 'https://www.gurufocus.com/term/growth_per_share_eps/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
