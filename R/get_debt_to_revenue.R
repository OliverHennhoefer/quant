#' Get Debt-to-Revenue Ratio
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/debt2rev/AAPL/).
#'
#' @usage get_debt_to_revenue(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's
#' **Debt to Revenue Ratio** of the last five fiscal years plus current years
#' TTM.
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_debt_to_revenue(df)
#'
#' @details
#' The Debt-to-Revenue Ratio is a personal finance measure that compares the
#' amount of debt you have to your overall income. Lenders, including issuers of
#' mortgages, use it as a way to measure your ability to manage the payments you
#' make each month and repay the money you have borrowed.
#'
get_debt_to_revenue <- function(df) {

  pfx <- 'debt2rev'
  url <- 'https://www.gurufocus.com/term/debt2rev/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
