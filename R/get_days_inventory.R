#' @title Get Days Inventory
#'
#' @description Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/DaysInventory/AAPL/).
#'
#' @usage get_days_inventory(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return Input data.frame supplemented by the company's available
#' **Days Inventory** data.
#' @export
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_days_inventory(df)
#'
#' @details
#' The Asset-Turnover-Ratio indicates the average time in day that a company
#' takes to turn its inventory, including goods that are work in progress,
#' into sales.

get_days_inventory <- function(df) {

  pfx <- 'days_inv'
  url <- 'https://www.gurufocus.com/term/DaysInventory/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
