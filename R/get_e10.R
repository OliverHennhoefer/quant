#' @title Get E10
#'
#' @description Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/e10/AAPL/).
#'
#' @usage get_e10(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return Input data.frame supplemented by the company's available
#' **E10** data.
#' @export
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_e10(df)
#'
#' @details
#' E10 is a main component used to calculate Shiller PE Ratio. If the month end
#' stock price for this stock is zero, result may not be accurate due to the
#' exchange rate between different shares and the data will not be stored into
#' our database. Selected historical data showed in the calculation section
#' below is only for demonstration purpose.
#' E10 is a concept invented by Prof. Robert Shiller, who uses E10 for his
#' Shiller P/E calculation. E10 is the average of the inflation adjusted
#' earnings of a company over the past 10 years

get_e10 <- function(df) {

  pfx <- 'e10'
  url <- 'https://www.gurufocus.com/term/e10/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
