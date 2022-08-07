#' @title Get Owners Earnings per Share
#'
#' @description Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/Owner_Earnings/AAPL/).
#'
#' @usage get_owners_eps(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return Input data.frame supplemented by the company's available
#' **Owners Earnings per Share** data.
#' @export
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_owners_eps(df)
#'
#' @details
#' The Owners Earnings per Share is a measure invented by Warren Buffet and
#' originally described in one of his famous annual shareholder letters as
#' follows: "If we think through these questions, we can gain some insights
#' about what may be called 'owner earnings.' These represent (a) reported
#' earnings plus (b) depreciation, depletion, amortization, and certain other
#' non-cash charges such as Company N's items (1) and (4) less the average
#' annual amount of capitalized expenditures for plant and equipment, etc. that
#' the business requires to fully maintain its long-term competitive position
#' and its unit volume. (If the business requires additional working capital to
#' maintain its competitive position and unit volume, the increment also should
#' be included in (c). However, businesses following the LIFO inventory method
#' usually do not require additional working capital if unit volume does not
#' change.)"

get_owners_eps <- function(df) {

  pfx <- 'owners.eps'
  url <- 'https://www.gurufocus.com/term/Owner_Earnings/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
