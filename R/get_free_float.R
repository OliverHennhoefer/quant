#' @title Get Float Percentage of Total Shares Outstanding
#'
#' @description Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/FloatPercentageOfTSO/AAPL/).
#'
#' @usage get_free_floate(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return Input data.frame supplemented by the company's available
#' **Float Percentage of Total Shares Outstanding** data.
#' @export
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_free_floate(df)
#'
#' @details
#' The free float percentage, also known as float percentage of total shares
#' outstanding, simply shows the percentage of shares outstanding that trade
#' freely.

get_free_floate <- function(df) {

  pfx <- 'fptso'
  url <- 'https://www.gurufocus.com/term/FloatPercentageOfTSO/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
