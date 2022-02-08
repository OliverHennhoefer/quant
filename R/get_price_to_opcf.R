#' Get Price-to-Operating-Cash-Flow-Ratio
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/pocf/AAPL/).
#'
#' @usage get_price_to_opcf(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's
#' **Price-to-Operating-Cash-Flow-Ratio**
#' of the last five fiscal years plus current years TTM.
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_price_to_opcf(df)
#'
#' @details
#' The Price-to-Operating-Cash-Flow-Ratio measures a company's value relative to
#' its Operating Cash Flows.
#'
get_price_to_opcf <- function(df) {

  pfx <- 'pocf'
  url <- 'https://www.gurufocus.com/term/pocf/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
