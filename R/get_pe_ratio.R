#' @title Get Price-Earnings Ratio
#'
#' @description Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/pe/AAPL/).
#'
#' @usage get_pe_ratio(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return Input data.frame supplemented by the company's available
#' **Price Earnings Ratio** data.
#' @export
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_pe_ratio(df)
#'
#' @details
#' The Price-Earnings Ratio calculated by the earnings divided by the market
#' capitalization of a company.

get_pe_ratio <- function(df) {

  pfx <- 'pe'
  url <- 'https://www.gurufocus.com/term/pe/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
