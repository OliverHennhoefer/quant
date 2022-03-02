#' Get Profitability Rank
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/rank_profitability/AAPL/).
#'
#' @usage get_profitability(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's **Profitability Rank**
#' of the last five fiscal years plus current years TTM.
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_profitability(df)
#'
#' @details
#' GuruFocus.com calculated the Profitability Rank by how profitable a company
#' is and how likely the company's business will stay that way. The maximum rank
#' is 10. A rank of 7 or higher means a higher profitability and may stay that
#' way. A rank of 3 or lower indicates that the company has had trouble to make
#' a profit.
#' The Profitability Rank is based on the Operating Margin and its 5-year
#' average, the Piotroski F-Score, the Consistency of the Profitability and the
#' Predictability Rank (see get_predicatability)
#'
#'
get_profitability <- function(df) {

  url <- 'https://www.gurufocus.com/term/rank_profitability/'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_profitability(df, url, xpath_txt))

  return(res)
}
