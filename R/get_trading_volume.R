#' @title
#' Get Trading Volume
#'
#' @description
#' Function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/stock/AAPL/summary).
#'
#' @usage get_trading_volume(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's average
#' **Trading Volume** over the last two months.
#'
#' @example
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_trading_volume(df)
#'
#' @export
#'
get_trading_volume <- function(df) {
  sanity(df)

  df$Volume <- NA
  rows <- nrow(df)
  pbar <- utils::txtProgressBar(0, rows, style = 3)

  for(i in 1:rows) {
    utils::setTxtProgressBar(pbar, i)

    ticker <- df$symbol[i]

    url <- paste0("https://www.gurufocus.com/stock/", ticker, "/summary")
    xpath <- '//*[@id="stock-header"]/div/div[1]/div/div[3]/div[4]'
    volume <- get_text(url, xpath = xpath)

    volume <- gsub(' ', '', gsub(',', '', volume))
    if( volume == 0) volume <- NA
    df$volume[i] <- as.numeric(volume)
  }

  return(df)
}
