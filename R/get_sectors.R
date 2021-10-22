#' Scrapes super sectors and corresponding sub sectors provided by the stock
#' summary from gurufocus.com/stock.
#'
#' @return get_sector() returns the provided data.frame with the additional
#' column (char) 'Sector' and 'Subsector'.
#'
#' @example
#' stock_sector - get_sector(stocks)
#'
get_sectors <- function(df) {
  check_sanity(df)

  df$Sector <- NA
  df$Subsector <- NA

  rows <- nrow(df)
  pbar <- utils::txtProgressBar(0, rows, style = 3)

  for( i in 1:rows) {
    utils::setTxtProgressBar(pbar, i)

    ticker <- df$Symbol[i]
    url <- paste0("https://www.gurufocus.com/stock/", ticker, "/summary")

    xpath <-'//*[@id="stock-header"]/div/div[1]/div/div[1]/div/div/span[2]/a'
    sector <- get_html_text(url, xpath = xpath)
    df$Sector[i] <- gsub("\n", "", sector)

    xpath <- '//*[@id="stock-header"]/div/div[1]/div/div[1]/div/div/span[3]/a'
    subsector <- get_html_text(url, xpath = xpath)
    df$Subsector[i] <- gsub("\n", "", subsector)
  }

  return(df)
}
