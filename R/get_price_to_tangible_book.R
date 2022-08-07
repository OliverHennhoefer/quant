#' @title Get Price-Tangible-Book-Ratio
#'
#' @description Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/p2tangible_book/AAPL/).
#'
#' @usage get_price_to_tangible_book(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return Input data.frame supplemented by the company's available
#' **Price-Tangible-Book-Ratio** data.
#' @export
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_price_to_tangible_book(df)
#'
#' @details
#' The Price-Tangible-Book-Ratio measures a company's market value to its
#' tangible assets. This ratio is applicable mainly to industrial or other
#' capital-intensive companies (manufacturers, miner, ...) that own a high
#' proportion of hard assets.

get_price_to_tangible_book <- function(df) {

  pfx <- 'tangible_book'
  url <- 'https://www.gurufocus.com/term/p2tangible_book/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
