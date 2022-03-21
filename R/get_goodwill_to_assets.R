#' @title
#' Get Goodwill to Assets Ratio
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/goodwill2asset/AAPL/).
#'
#' @usage get_goodwill_to_assets(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's
#' **Goodwill to Asset Ratio** of the last five fiscal years plus current years
#' TTM.
#'
#' @example
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_goodwill_to_assets(df)
#'
#' @details
#' The Asset-Turnover-Ratio measures the proportion of a company's goodwill,
#' which is an intangible asset, to its total assets and is a factor in that
#' company's valuation. The ratio quantifies a company's brand value and other
#' intangible aspects of its valuation.
#'
#' @export
#'
get_goodwill_to_assets <- function(df) {

  pfx <- 'goodwill2asset'
  url <- 'https://www.gurufocus.com/term/goodwill2asset/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
