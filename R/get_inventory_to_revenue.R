#' Get Inventory to Revenue Ratio
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/inventory2rev/AAPL/).
#'
#' @usage get_inventory_to_revenue(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's
#' **Inventory to Revenue Ratio** of the last five fiscal years plus current
#' years TTM.
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_inventory_to_revenue(df)
#'
#' @details
#' The Asset-Turnover-Ratio measures the percentage of inventories the company
#' currently has on hand to support the current amount of revenue. The ratio
#' indicated of a company to manage their inventory levels.
#'
get_inventory_to_revenue <- function(df) {

  pfx <- 'inventory2rev'
  url <- 'https://www.gurufocus.com/term/inventory2rev/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
