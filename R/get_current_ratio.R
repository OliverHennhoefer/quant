#' @title Get Current Ratio
#'
#' @description Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/current_ratio/AAPL/).
#'
#' @usage get_current_ratio(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return Input data.frame supplemented by the company's available
#' **Current Ratio** data.
#' @export
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_current_ratio(df)
#'
#' @details
#' The Current Ratio measures a company's ability to its shot-term obligations.

get_current_ratio <- function(df) {

  pfx <- 'current_ratio'
  url <- 'https://www.gurufocus.com/term/current_ratio/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
