#' @title
#' Get Buyback Yield
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/buyback_yield/AAPL/).
#'
#' @usage get_buyback_yield(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's **Buyback Yield** of
#' the last five fiscal years plus current years TTM.
#'
#' @example
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_buyback_yield(df)
#'
#' @details
#' The buyback yield gives the repurchased outstanding shares in relation to the
#' market capitalization. Higher buyback yields may indicate the managements
#' expectation that the stock is undervalued or its attempt to prevent a hostile
#' takeover among other reasons.
#'
#' @export
#'
get_buyback_yield <- function(df) {

  pfx <- 'buyback_yield'
  url <- 'https://www.gurufocus.com/term/buyback_yield/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
