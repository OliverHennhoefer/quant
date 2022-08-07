#' @title Get Net-Net Working Capital
#'
#' @description Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/NCAV/AAPL/).
#'
#' @usage get_net_net_working_capital(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return Input data.frame supplemented by the company's available
#' **Net-Net Working Capital** data.
#' @export
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_net_net_working_capital(df)
#'
#' @details
#' The Net-Net Working Capital technique was developed by Benjamin Graham, in
#' which a company is valued based on its net-current assets per share (NCAVPS).
#' The Net-Net Working Capital is calculated based on current assets, taking
#' cash and cash equivalents at full value, then reducing accounts receivable
#' for doubtful accounts and reducing inventories to liquidation values. Net-net
#' value is calculated by deducting total liabilities from the adjusted current
#' assets. Since the measure does not consider long-term assets or liabilities,
#' it is unreliable for long-term investments.

get_net_net_working_capital <- function(df) {

  pfx <- 'nnwc'
  url <- 'https://www.gurufocus.com/term/NCAV/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
