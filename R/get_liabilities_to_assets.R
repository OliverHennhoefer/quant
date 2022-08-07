#' @title Get Liabilities to Assets Ratio
#'
#' @description Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/turnover/AAPL/).
#'
#' @usage get_liabilities_to_assets(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return Input data.frame supplemented by the company's available
#' **Liabilities-to-Assets-Ratiop** data.
#' @export
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_liabilities_to_assets(df)
#'
#' @details
#' The Liabilities to Assets Ratio is a solvency ratio indicating how much of
#' the company's assets are made of liabilities, calculated as total liabilities
#' divided by total assets. The higher the ratio is, the more risk there is in
#' the company.

get_liabilities_to_assets <- function(df) {

  pfx <- 'liabilities2assets'
  url <- 'https://www.gurufocus.com/term/liabilities_to_assets/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
