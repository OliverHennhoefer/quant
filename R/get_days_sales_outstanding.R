#' Get Days Sales Outstanding
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/DaysSalesOutstanding/AAPL/).
#'
#' @usage get_days_sales_outstanding(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's
#' **Days Sales Outstanding** of the last five fiscal years plus current years
#' TTM.
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_days_sales_outstanding(df)
#'
#' @details
#' The Days Sales Outstanding is the average number of days it takes a company
#' to receive payment for a sale. A higher Days Sales Outstanding indicates the
#' company is getting its payments quickly. Generally DSO <45 days is considered
#' low.
#'
get_days_sales_outstanding <- function(df) {

  pfx <- 'DaysSalesOutstanding'
  url <- 'https://www.gurufocus.com/term/DaysSalesOutstanding/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
