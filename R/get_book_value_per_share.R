#' @title Get Book Value per Share
#'
#' @description Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/Book+Value+Per+Share/AAPL/).
#'
#' @usage get_book_value_per_share(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return Input data.frame supplemented by the company's available
#' **Book Value per Share** data.
#' @export
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_book_value_per_share(df)
#'
#' @details
#' Book value per common share (or, simply book value per share - BVPS) is a
#' method to calculate the per-share book value of a company based on common
#' shareholders' equity in the company. The book value of a company is the
#' difference between that company's total assets and total liabilities, and not
#' its share price in the market.

get_book_value_per_share <- function(df) {

  pfx <- 'bvps'
  url <- 'https://www.gurufocus.com/term/Book+Value+Per+Share/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
