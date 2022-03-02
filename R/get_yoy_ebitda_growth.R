#' Get Year-over-Year Earnings before Interest, Tax and Appreciation Growth
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com]\
#' (https://www.gurufocus.com/term/growth_per_share_ebitda/AAPL/).
#'
#' @usage get_yoy_ebitda_growth(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's
#' **Year-over-Year Earnings before Interest, Tax and Appreciation Growth** of
#' the last five fiscal years plus current years TTM.
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_yoy_ebitda_growth(df)
#'
#' @details
#' YoY EBITDA Growth is the percentage change of EBITDA per Share over the past
#' twelve months.
#'
get_yoy_ebitda_growth <- function(df) {

  pfx <- 'yoy_ebitda_gwth'
  url <- 'https://www.gurufocus.com/term/growth_per_share_ebitda/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
