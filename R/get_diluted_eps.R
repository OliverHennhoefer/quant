#' @title Get Diluted Earnings per Share
#'
#' @description Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/per+share+eps/AAPL/).
#'
#' @usage get_diluted_eps(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return Input data.frame supplemented by the company's available
#' **Diluted Earnings per Share ** data.
#' @export
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_diluted_eps(df)
#'
#' @details
#' The Diluted Earnings per Share calculates a company's earnings per share if
#' all convertible securities were converted. Dilutive securities aren't common
#' stock, but instead securities that can be converted to common stock.

get_diluted_eps <- function(df) {

  pfx <- 'epsd'
  url <- 'https://www.gurufocus.com/term/per+share+eps/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
