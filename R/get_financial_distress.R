#' Get Probability of Financial Distress
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/PFD/AAPL/).
#'
#' @usage get_financial_distress(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's current
#' **Probability of Financial Distress**.
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_financial_distress(df)
#'
#' @details
#' The Probability of Financial Distress measures the probability that a company
#' will go bankrupt in the upcoming year given its current financial position.
#' The measure is obtained by a logit probability model based on eight
#' explanatory variables.
#'
get_financial_distress <- function(df) {

  pfx <- 'fin.distress'
  url <- 'https://www.gurufocus.com/term/PFD/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
