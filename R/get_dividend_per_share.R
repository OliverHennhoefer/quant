#' @title Get Dividend per Share
#'
#' @description Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/Dividends+Per+Share/AAPL/).
#'
#' @usage get_dividend_per_share(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return Input data.frame supplemented by the company's available
#' **Dividend per Share** data.
#' @export
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_dividend_per_share(df)
#'
#' @details
#' Dividend per share (DPS) is the sum of declared dividends issued by a company
#' for every ordinary share outstanding. The figure is calculated by dividing
#' the total dividends paid out by a business, including interim dividends, over
#' a period of time, usually a year, by the number of outstanding ordinary
#' shares issued.

get_dividend_per_share <- function(df) {

  pfx <- 'divps'
  url <- 'https://www.gurufocus.com/term/Dividends+Per+Share/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
