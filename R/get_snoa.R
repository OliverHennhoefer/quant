#' @title Get Scaled Net Operating Assets
#'
#' @description Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/SNOA/AAPL/).
#'
#' @usage get_snoa(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return Input data.frame supplemented by the company's available
#' **Scaled Net Operating Assets** data.
#' @export
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_snoa(df)
#'
#' @details
#' Scaled Net Operating Assets (SNOA) is calculated as the difference between
#' operating assets and operating liabilities, scaled by lagged total assets.

get_snoa <- function(df) {

  pfx <- 'snoa'
  url <- 'https://www.gurufocus.com/term/SNOA/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
