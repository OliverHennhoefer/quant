#' @title
#' Get Tangible Book Value Per Share
#'
#' @description
#' Fetching *Tangible Book Value Per Share* from gurufocus.com
#'
#' @usage get_tangible_book_per_share(df)
#'
#' @param df data.frame. Data.frame with column *symbol* containing at least one
#' valid stock ticker symbol.
#'
#' @example
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_tangible_book_per_share(df)
#'
#' @details
#' The *Tangible book value per share* is the value of a company's tangible
#' assets divided by its current outstanding shares. The TBVPS determines the
#' potential value per share of a company in the event that it must liquidate
#' it's assets.
#' Assets such as property and equipment are considered tangible assets.
#'
#' @return
#' The original data.frame supplemented by the company's
#' **Tangible Book Per Share** of the last five fiscal years as well as current
#' years TTM value.
#'
#' @export
#'
get_tangible_book_per_share <- function(df) {

  pfx <- 'tbvps'
  url <- 'https://www.gurufocus.com/term/Tangibles_book_per_share/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
