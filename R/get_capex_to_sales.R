#' @title Get CAPEX-Sales-Ratio
#'
#' @description Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/capex_to_revenue/AAPL/).
#'
#' @usage get_capex_to_sales(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return Input data.frame supplemented by the company's available
#' **CAPEX-Sales-Ratio** data.
#' @export
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_capex_to_sales(df)
#'
#' @details
#' The CAPEX-Sales-Ratio measures a company's investments into property, plant,
#' equipment and other capital assets (CAPEX) relative to its total sales. The
#' measure indicates how aggressively a company is reinvesting its revenue into
#' productive assets. The interpretation of the ratio depends on how effectively
#' a company uses its assets to produce new income.

get_capex_to_sales <- function(df) {

  pfx <- 'capex2rev'
  url <- 'https://www.gurufocus.com/term/capex_to_revenue/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
