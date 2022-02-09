#' Get Price-to-Free-Cash-Flow-Ratio
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/pfcf/AAPL/).
#'
#' @usage get_price_to_fcf(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's
#' **Price-to-Free-Cash-Flow-Ratio** of the last five fiscal years plus current
#' years TTM.
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_price_to_fcf(df)
#'
#' @details
#' The Price-to-Free-Cash-Flow-Ratio measures a company's value relative to its
#' Free Cash Flows.
#'
get_price_to_fcf <- function(df) {

  pfx <- 'pfcf'
  url <- 'https://www.gurufocus.com/term/pfcf/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  # Price to Free Cash Flow Ratio ----------------------------------------------
  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
