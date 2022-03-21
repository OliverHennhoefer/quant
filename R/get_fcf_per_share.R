#' @title
#' Get Free Cash Flow per Share
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/turnover/AAPL/).
#'
#' @usage get_fcf_per_share(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's
#' **Free Cash Flow per Share** of the last five fiscal years plus current years
#' TTM.
#'
#' @example
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_fcf_per_share(df)
#'
#' @details
#' Free cash flow per share (FCF) is a measure of a company's financial
#' flexibility that is determined by dividing free cash flow by the total number
#' of shares outstanding. This measure serves as a proxy for measuring changes
#' in earnings per share.
#'
#' @export
#'
get_fcf_per_share <- function(df) {

  pfx <- 'fcfps'
  url <- 'https://www.gurufocus.com/term/per+share_freecashflow/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
