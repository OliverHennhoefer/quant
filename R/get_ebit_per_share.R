#' @title Get Earnings Before Interest and Taxes per Share
#'
#' @description Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/EBIT_per_share/AAPL/).
#'
#' @usage get_ebit_per_share(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return Input data.frame supplemented by the company's available
#' **Earnings Before Interest and Taxes per Share** data.
#' @export
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_ebit_per_share(df)
#'
#' @details
#' EBIT per Share is the amount of Earnings Before Interest and Taxes (EBIT) per
#' outstanding share of the company's stock.

get_ebit_per_share <- function(df) {

  pfx <- 'ebitps'
  url <- 'https://www.gurufocus.com/term/EBIT_per_share/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
