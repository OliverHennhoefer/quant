#' @title
#' Get Financial Strength Rank
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/rank_balancesheet/AAPL/).
#'
#' @usage get_financial_strength(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's current years
#' **Financial Strength Rank**.
#'
#' @example
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_financial_strength(df)
#'
#' @details
#' The Financial Strength Rank measures how strong a company's financial
#' situation is. The rank is base on following factors:
#' \itemize{
#'   \item Interest Coverage
#'
#'   \item Debt-to-Revenue Ratio
#'
#'   \item Altman Z-score
#' }
#' Companies with a rank of 3 or less are likely to be in financial distress.
#'
get_financial_strength <- function(df) {

  pfx <- 'fin_strength'
  url <- 'https://www.gurufocus.com/term/rank_balancesheet/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
