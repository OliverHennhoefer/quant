#' @title
#' Get Earnings Yield (Formula by Joel Greenblatt)
#'
#' @description
#' Fetching *Earnings Yield (Formula by Joel Greenblatt)* from gurufocus.com.
#'
#' @usage get_greenblatt_earnings_yield(df)
#'
#' @param df data.frame. Data frame with column *symbol* containing at least one
#' valid stock ticker symbol.
#'
#' @example
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_greenblatt_earnings_yield(df)
#'
#' @details
#' *Joel Greenblatt's definition of Earnings Yield* has the same problems the
#' regular earnings yield does. It does not consider the growth of the company.
#' It only looks at one-year's business operation. For cyclical companies, the
#' earnings yield is usually highest at the peak of the business cycle, although
#' these earnings are rarely sustainable.
#'
#' @return
#' The original data.frame supplemented by the company's
#' **Earnings Yield (Joel Greenblatt)** of the last five fiscal years as well as
#' it's current years TTM value.
#'
#' @export
#'
get_greenblatt_earnings_yield <- function(df) {

  pfx <- 'earning_yield_greenblatt'
  url <- 'https://www.gurufocus.com/term/earning_yield_greenblatt/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
