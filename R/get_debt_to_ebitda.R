#' Get Debt to EBITDA
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/debt2ebitda/AAPL/).
#'
#' @usage get_debt_to_ebitda(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's **Debt to EBITDA** of
#' the last five fiscal years plus current years TTM.
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_debt_to_ebitda(df)
#'
#' @details
#' The Debt to EBITDA is a ratio measuring the amount of income generated and
#' available to pay down debt before covering interest, taxes, depreciation,
#' and amortization expenses. Generally, net debt-to-EBITDA ratios of less than
#' 3 are considered acceptable. The lower the ratio, the higher the probability
#' of the firm successfully paying off its debt. Ratios higher than 3 or 4 serve
#' as “red flags” and indicate that the company may be financially distressed in
#' the future.
#'
get_debt_to_ebitda <- function(df) {

  pfx <- 'debt2ebitda'
  url <- 'https://www.gurufocus.com/term/debt2ebitda/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
