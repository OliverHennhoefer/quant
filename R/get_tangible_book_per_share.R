#' Get Tangible Book Per Share
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/Tangibles_book_per_share/AAPL/).
#'
#' @usage get_tangible_book_per_share(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's
#' **Tangible Book Per Share** of the last five fiscal years plus current years
#' TTM.
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_tangible_book_per_share(df)
#'
#' @details
#' Tangible book value per share (TBVPS) is the value of a company's tangible
#' assets divided by its current outstanding shares. TBVPS determines the
#' potential value per share of a company in the event that it must liquidate
#' its assets. Assets such as property and equipment are considered tangible
#' assets.
#'
get_tangible_book_per_share <- function(df) {

  pfx <- 'tbps'
  url <- 'https://www.gurufocus.com/term/Tangibles_book_per_share/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
