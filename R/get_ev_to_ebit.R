#' Get Enterprise Value to Earnings before Interest Ratio
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/ev2ebit/AAPL/).
#'
#' @usage get_ev_to_ebit(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's
#' **Enterprise Value to Earnings before Interest Ratio** of the last five
#' fiscal years plus current years TTM.
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_ev_to_ebit(df)
#'
#' @details
#' The enterprise value to earnings before interest, taxes, depreciation, and
#' amortization ratio (EV/EBITDA) compares the value of a company—debt
#' included—to the company's cash earnings less non-cash expenses.
#'
get_ev_to_ebit <- function(df) {

  pfx <- 'ev2ebit'
  url <- 'https://www.gurufocus.com/term/ev2ebit/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
