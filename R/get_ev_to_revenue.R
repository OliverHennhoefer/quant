#' @title
#' Get Enterprise-Value-to-Revenue Ratio
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/ev2rev/AAPL/).
#'
#' @usage get_ev_to_revenue(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's
#' **Enterprise-Value-to-Revenue Ratio** of the last five fiscal years plus
#' current years TTM.
#'
#' @example
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_ev_to_revenue(df)
#'
#' @details
#' The Enterprise-Value-to-Revenue Ratio is calculated as the company's
#' enterprise value relative to its revenue. Often used to value a company
#' that does not generate income/profits yet.
#'
get_ev_to_revenue <- function(df) {

  pfx <- 'ev2rev'
  url <- 'https://www.gurufocus.com/term/ev2rev/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
