#' @title
#' Get Earnings per Share without Non-recurrent Items
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/eps_nri/AAPL/).
#'
#' @usage get_eps_ex_nri(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's
#' **Earnings per Share ex Non-recurrent Items** of the last five fiscal years
#' plus current years TTM.
#'
#' @example
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_eps_ex_nri(df)
#'
#' @details
#' The Earnings per Share without Non-recurrent Items is calculated by
#' subtracting non-recurring items, the dividends of preferred stocks and
#' non-operating income from the total net income. With that the measure gives
#' a better impression about the real earnings power of a company.
#'
get_eps_ex_nri <- function(df) {

  pfx <- 'epsnri'
  url <- 'https://www.gurufocus.com/term/eps_nri/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
