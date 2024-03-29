#' @title Get Year-over-Year Revenue Per Share Growth
#'
#' @description Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/growth_per_share_rev/AAPL/).
#'
#' @usage get_yoy_revenue_growth(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return Input data.frame supplemented by the company's available
#' **Year-over-Year Revenue Per Share Growth** data.
#' @export
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_yoy_revenue_growth(df)
#'
#' @details
#' YoY Rev. per Sh. Growth is the percentage change of Revenue per Share over
#' the past twelve months

get_yoy_revenue_growth <- function(df) {

  pfx <- 'yoy_rps_gwth'
  url <- 'https://www.gurufocus.com/term/growth_per_share_rev/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
