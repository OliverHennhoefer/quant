#' @title
#' Get Inventory Turnover
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/InventoryTurnover/AAPL/).
#'
#' @usage get_inventory_turnover(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's **Inventory Turnover**
#' of the last five fiscal years plus current years TTM.
#'
#' @example
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_inventory_turnover(df)
#'
#' @details
#' Inventory Turnover measures how fast the company turns over its inventory
#' within a year. It is calculated as Cost of Goods Sold divided by Total
#' Inventories.
#'
get_inventory_turnover <- function(df) {

  pfx <- 'inventory_turnover'
  url <- 'https://www.gurufocus.com/term/InventoryTurnover/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
