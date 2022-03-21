#' @title
#' Get Price to Book Ratio
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/pb/AAPL/).
#'
#' @usage get_price_to_book(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's **Price to Book Ratio**
#' of the last five fiscal years plus current years TTM.
#'
#' @example
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_price_to_book(df)
#'
#' @details
#' The Asset-Turnover-Ratio measures the market price of a company to its book
#' value.
#'
#' @export
#'
get_price_to_book <- function(df) {

  pfx <- 'pb'
  url <- 'https://www.gurufocus.com/term/pb/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
