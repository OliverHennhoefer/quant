#' @title
#' Get Debt to Asset Ratio
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/turnover/AAPL/).
#'
#' @usage get_debt_to_assets(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's **Debt to Asset Ratio**
#' of the last five fiscal years plus current years TTM.
#'
#' @example
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_debt_to_assets(df)
#'
#' @details
#' The Asset-Turnover-Ratio is a leverage ratio that defines the total amount of
#' debt relative to a company's assets. A ratio of about >= 1 means a company
#' owns the same amount of liabilities or more as its assets and with that is
#' highly leveraged. Lower ratios indicate that a company owns more asset than
#' liabilities and can meet its obligations by selling assets if needed.
#'
#' @export
#'
get_debt_to_assets <- function(df) {

  pfx <- 'debt2asset'
  url <- 'https://www.gurufocus.com/term/debt2asset/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
