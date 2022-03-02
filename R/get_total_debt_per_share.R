#' Get Total Debt Per Share
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/Total_Debt_Per_Share/AAPL/).
#'
#' @usage get_total_debt_per_share(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's **Altman Z-score**
#' of the last five fiscal years plus current years TTM.
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_total_debt_per_share(df)
#'
#' @details
#' Total Debt per Share is calculated as total debt divided by Shares
#' Outstanding (EOP). Total debt is calculated as Long-Term Debt & Capital Lease
#' Obligation plus Short-Term Debt & Capital Lease Obligation.
#'
get_total_debt_per_share <- function(df) {

  pfx <- 'tdps'
  url <- 'https://www.gurufocus.com/term/Total_Debt_Per_Share/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
