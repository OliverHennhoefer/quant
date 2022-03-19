#' @title
#' Get Gross Profit to Asset Ratio
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/turnover/AAPL/).
#'
#' @usage get_gross_profit_to_assets(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's
#' **Gross Profit to Asset Ratio** of the last five fiscal years plus current
#' years TTM.
#'
#' @example
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_gross_profit_to_assets(df)
#'
#' @details
#' The Asset-Turnover-Ratio is calculated as Gross Profits divided by the firm's
#' Total Assets. The ratio determined how efficiently a firm uses its assets to
#' generate gross profits.
#'
get_gross_profit_to_assets <- function(df) {

  pfx <- 'grossprofit2asset'
  url <- 'https://www.gurufocus.com/term/grossprofit2asset/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
