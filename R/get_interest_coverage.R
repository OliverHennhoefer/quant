#' @title
#' Get Interest Coverage
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/turnover/AAPL/).
#'
#' @usage get_interest_coverage(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's **Interest Coverage**
#' of the last five fiscal years plus current years TTM.
#'
#' @example
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_interest_coverage(df)
#'
#' @details
#' The Interest Coverage measures how easily a company ca pay interest
#' expenses on outstanding debt. It is calculated by diving a company's
#' Operating Income by its Interest Expense. Higher a coverage are naturally
#' better for the financial stability of a company.
#'
#' @export
#'
get_interest_coverage <- function(df) {

  pfx <- 'interest_coverage'
  url <- 'https://www.gurufocus.com/term/interest_coverage/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
