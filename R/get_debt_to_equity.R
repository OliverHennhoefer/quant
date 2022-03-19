#' @title
#' Get Debt to Equity Ratio
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/deb2equity/AAPL/).
#'
#' @usage get_debt_to_equity(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's
#' **Debt to Equity Ratio** of the last five fiscal years plus current years
#' TTM.
#'
#' @example
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_debt_to_equity(df)
#'
#' @details
#' The debt-to-equity (D/E) ratio compares a company's total liabilities to its
#' shareholder equity and can be used to evaluate how much leverage a company is
#' using. Higher-leverage ratios tend to indicate a company or stock with higher
#' risk to shareholders.
#'
get_debt_to_equity <- function(df) {

  pfx <- 'deb2equity'
  url <- 'https://www.gurufocus.com/term/deb2equity/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
