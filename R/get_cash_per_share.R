#' @title Get Cash-per-Share
#'
#' @description Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/cash_per_share/AAPL/).
#'
#' @usage get_cash_per_share(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return Input data.frame supplemented by the company's available
#' **Cash-per-Share** data.
#' @export
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_cash_per_share(df)
#'
#' @details
#' Cash-per-Share gives the cash, cash equivalents and marketable securities
#' divided by the shares outstanding.

get_cash_per_share <- function(df) {

  pfx <- 'cps'
  url <- 'https://www.gurufocus.com/term/cash_per_share/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
