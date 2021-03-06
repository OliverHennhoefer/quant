#' @title
#' Get Cash Conversion Cycle
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/CCC/AAPL/).
#'
#' @usage get_cash_conv_cycle(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's
#' **Cash Conversion Cycle** of the last five fiscal years plus current years
#' TTM.
#'
#' @example
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_cash_conv_cycle(df)
#'
#' @details
#' The Cash Conversion Cycle measures the amount of days it takes for a company
#' to convert its investments in inventory and other resources into cash flows
#' from sales. The measure it calculated by Days Sales Outstanding +
#' Days Inventory - Days Payable.
#'
#' A negative value indicates that it takes a company longer to pay its
#' suppliers than it takes the company to sell its inventory and collect its
#' money. It is difficult to compare the Cash Conversion Cycle between
#' different industries.
#'
#' @export
#'
get_cash_conv_cycle <- function(df) {

  pfx <- 'cash_conv_cycle'
  url <- 'https://www.gurufocus.com/term/CCC/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
