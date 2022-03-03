#' Get Forward Rate of Return (Yacktman)
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/RateOfReturn/AAPL/).
#'
#' @usage get_yacktman_forward_return(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's
#' **Forward Rate of Return (Yacktman)** of the last five fiscal years plus
#' current years TTM.
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_yacktman_forward_return(df)
#'
#' @details
#' Yacktman defines forward rate of return as the normalized free cash flow
#' yield plus real growth plus inflation. 's forward rate of return for was
#' 0.00%. Unlike the Earnings Yield %, the Forward Rate of Return uses the
#' normalized Free Cash Flow of the past seven years, and considers growth.
#' The forward rate of return can be thought of as the return that investors
#' buying the stock today can expect from it in the future.
#'
get_yacktman_forward_return <- function(df) {

  pfx <- 'RateOfReturn'
  url <- 'https://www.gurufocus.com/term/RateOfReturn/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
