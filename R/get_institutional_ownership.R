#' @title Get Institutional Ownership Percentage
#'
#' @description Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/InstitutionalOwnership/AAPL/).
#'
#' @usage get_institutional_ownership(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return Input data.frame supplemented by the company's available
#' **Institutional Ownership** data.
#' @export
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_institutional_ownership(df)
#'
#' @details
#' The Institutional Ownership is the percentage of shares that are owned by
#' mutual or pension funds, insurance companies, investment firms, private
#' foundations, endowments and other large entities that manage funds on behalf
#' of others relative to the total shares outstanding.High institutional
#' ownership can in many cases be interpreted as a signal of confidence.

get_institutional_ownership <- function(df) {

  pfx <- 'inst.own'
  url <- 'https://www.gurufocus.com/term/InstitutionalOwnership/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(
    scrape_ownership_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
