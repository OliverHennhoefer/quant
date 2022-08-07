#' @title Get Piotroski F-Score
#'
#' @description Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/turnover/AAPL/).
#'
#' @usage get_piotroski_f(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return Input data.frame supplemented by the company's available
#' **Piotroski F-Score** data.
#' @export
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_piotroski_f(df)
#'
#' @details
#' The Asset-Turnover-Ratio measures the value of a company's
#' *Net Sales Revenue* relative to the value of its *Total Assets*. The ratio
#' indicates how effectively a company is using its assets in order to generate
#' sales.

get_piotroski_f <- function(df) {

  pfx <- 'fscore'
  url <- 'https://www.gurufocus.com/term/fscore/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
