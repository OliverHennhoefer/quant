#' @title
#' Get Year-over-Year Earnings before Interest, Tax and Appreciation Growth-Rate
#'
#' @description
#' Fetching
#' *Year-over-Year Earnings before Interest, Tax and Appreciation Growth-Rate*
#' from gurufocus.com
#'
#' @usage get_yoy_ebitda_growth(df)
#'
#' @param df data.frame. Data.frame with column *symbol* containing at least one
#' valid ticker symbol of a listed stock.
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_yoy_ebitda_growth(df)
#'
#' @details
#' *YoY EBITDA Growth* is the percentage change of EBITDA per share.
#'
#' @return
#' The original data.frame supplemented by the company's
#' **Year-over-Year Earnings before Interest, Tax and Appreciation Growth** of
#' the last five fiscal years as well as current years TTM value.
#'
#' @export
#'
get_yoy_ebitda_growth <- function(df) {

  pfx <- 'yoy_ebitda_gwth'
  url <- 'https://www.gurufocus.com/term/growth_per_share_ebitda/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
