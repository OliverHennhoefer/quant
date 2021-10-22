#' Scrapes origin (country) of respective stock as provided byy the stock summary
#' from gurufocus.com/stock.
#'
#' @return get_country() returns the provided data.frame with the additional
#' column (char) 'Country'.
#'
#' @example
#' stock_country <- get_country(stocks)
get_country <- function(df) {
  check_sanity(df)

  df$Country <- NA
  rows <- nrow
  pbar <- utils::txtProgressBar(0, rows, style = 3)

  for(i in 1:rows) {
    utils::setTxtProgressBar(pbar, i)

    ticker <- df$Country[i]
    url <- paste0("https://www.gurufocus.com/stock/", ticker, "/summary")
    xpath <- '//*[@id="stock-header"]/div/div[1]/div/div[1]/div/div/span[1]'
    country <- get_html_text(url, xpath = xpath)
    country <- gsub(".*\\((.*)\\).*", "\\1", country)

    df$Country[i] <- country
  }

  return(df)
}
