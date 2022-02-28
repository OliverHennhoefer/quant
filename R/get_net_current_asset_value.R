#' Get Net Current Asset Value
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/NCAV_real/AAPL/).
#'
#' @usage get_net_current_asset_value(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's
#' **Net Current Asset Value** of the last five fiscal years plus current years
#' TTM.
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_net_current_asset_value(df)
#'
#' @details
#' The Net Current Asset Value is a company's liquidation value. The liquidation
#' value is the total worth of all its physical assets, such as fixtures,
#' equipment, inventory and real estate. It excludes intangible assets, such as
#' intellectual property, brand recognition and goodwill.
#'
get_net_current_asset_value <- function(df) {

  pfx <- 'ncav'
  url <- 'https://www.gurufocus.com/term/NCAV_real/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
