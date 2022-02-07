#' Get Cash-Debt-Ratio
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/turnover/AAPL/).
#'
#' @usage get_cash_to_debt(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the companys **Cash-Debt-Ratio**
#' of the last five fiscal years plus current years TTM.
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_cash_to_debt(df)
#'
#' @details
#' The Cash-Debt-Ratio measures a company's cash, cash equivalents, marketable
#' securities relative to its debt. Cash-Debt-Ratios >1 indicate that a company
#' can pay off its debt using its cash on hand.
#'
get_cash_to_debt <- function(df) {

  pfx <- 'cash2debt'
  url <- 'https://www.gurufocus.com/term/cash2debt/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
