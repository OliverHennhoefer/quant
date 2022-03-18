#' Get Piotroski F-Score
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/turnover/AAPL/).
#'
#' @usage get_piotroski_f_score(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's **Piotroski F-Score**
#' of the last five fiscal years plus current years TTM.
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_piotroski_f_score(df)
#'
#' @details
#' The Asset-Turnover-Ratio measures the value of a companys *Net Sales Revenue*
#' relative to the value of its *Total Assets*. The ratio indicates how
#' effectively a company is using its assets in order to generate sales.
#'
get_piotroski_f_score<- function(df) {

  pfx <- 'fscore'
  url <- 'https://www.gurufocus.com/term/fscore/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
