#' @title Effective Annual Interest Rate
#'
#' @description Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/turnover/AAPL/).
#'
#' @usage get_eff_interest_rate(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return Input data.frame supplemented by the company's available
#' **Effective Annual Interest Rate** data.
#' @export
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_eff_interest_rate(df)
#'
#' @details
#' The Effective Annual Interest Rate is the interest rate on a loan restated
#' from the nominal interest rate and expressed as if compound interest was
#' payable annually. It makes interest rates between loans with different
#' compounding periods more comparable.

get_eff_interest_rate <- function(df) {

  pfx <- 'EffectiveInterestRate'
  url <- 'https://www.gurufocus.com/term/EffectiveInterestRate/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
