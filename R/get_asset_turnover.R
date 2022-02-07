#' Get Asset-Turnover-Ratio
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/turnover/AAPL/).
#'
#' @usage get_asset_turnover(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's **Altman Z-score**
#' of the last five fiscal years plus current years TTM.
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_asset_turnover(df)
#'
#' @details
#' The Asset-Turnover-Ratio measures the value of a companys *Net Sales Revenue*
#' relative to the value of its *Total Assets*. The ratio indicates how
#' effectively a company is using its assets in order to generate sales.
#'
#'
get_asset_turnover <- function(df) {

  pfx <- 'asset_turnover'
  url <- 'https://www.gurufocus.com/term/turnover/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  # Asset Turnover Ratio -------------------------------------------------------
  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
