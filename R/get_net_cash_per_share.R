#' Get Net Cash per Share
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/netcash/AAPL/).
#'
#' @usage get_net_cash_per_share(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's **Net Cash per Share**
#' of the last five fiscal years plus current years TTM.
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_net_cash_per_share(df)
#'
#' @details
#' Net Cash per Share is calculated by taking all a company's cash, less all
#' current liabilities and dividing that number by the total shares outstanding.
#'
get_net_cash_per_share <- function(df) {

  pfx <- 'ncps'
  url <- 'https://www.gurufocus.com/term/netcash/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
