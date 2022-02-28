#' Get Equity-to-Total-Assets Ratio
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/equity2asset/AAPL/).
#'
#' @usage get_equity_to_assets(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's
#' **Equity-to-Total-Assets Ratio** of the last five fiscal years plus current
#' years TTM.
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_equity_to_assets(df)
#'
#' @details
#' The Asset-Turnover-Ratio measures the amount of equity the business or farm
#' has when compared to the total assets owned by the business or farm. To
#' determine the Equity-To-Asset ratio you divide the Net Worth by the Total
#' Assets. This ratio is measured as a percentage.
#'
get_equity_to_assets <- function(df) {

  pfx <- 'equity2asset'
  url <- 'https://www.gurufocus.com/term/equity2asset/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
