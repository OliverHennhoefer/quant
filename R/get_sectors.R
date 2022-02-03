get_sectors <- function(df) {
  sanity(df)

  df$sector <- NA
  df$subsector <- NA

  rows <- nrow(df)
  pbar <- utils::txtProgressBar(0, rows, style = 3)

  for( i in 1:rows) {
    utils::setTxtProgressBar(pbar, i)

    ticker <- df$symbol[i]
    url <- paste0("https://www.gurufocus.com/stock/", ticker, "/summary")

    xpath <-'//*[@id="stock-header"]/div/div[1]/div/div[1]/div/div/span[2]/a'
    sector <- get_text(url, xpath = xpath)
    df$sector[i] <- gsub("\n", "", sector)

    xpath <- '//*[@id="stock-header"]/div/div[1]/div/div[1]/div/div/span[3]/a'
    subsector <- get_text(url, xpath = xpath)
    df$subsector[i] <- gsub("\n", "", subsector)
  }

  return(df)
}
