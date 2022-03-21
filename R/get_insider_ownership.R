#' @title
#' Get Insider Ownership
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/InsiderOwnership/AAPL/).
#'
#' @usage get_insider_ownership(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's **Insider Ownership**
#' of the last five fiscal years plus current years TTM.
#'
#' @example
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_insider_ownership(df)
#'
#' @details
#' The Insider Ownership is the percentage of shares that are owned by company
#' insiders relative to the total shares outstanding. Insiders are a company's
#' officers, directors, relatives or generally everyone with key information
#' before made available to the public. High insider ownership can in many cases
#' be interpreted as a signal of confidence. Larger companies have typically
#' low(er) insider ownership.
#'
#' @export
#'
get_insider_ownership <- function(df) {

  pfx <- 'insider.own'
  url <- 'https://www.gurufocus.com/term/InsiderOwnership/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(
    scrape_ownership_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
