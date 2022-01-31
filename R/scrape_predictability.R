scrape_predictability<- function(df, url, xpath_txt) {

  sanity(df)

  df$predictability <- NA
  rows <- nrow(df)
  pbar <- utils::txtProgressBar(0, rows, style = 3)

  for(i in 1:rows) {
    utils::setTxtProgressBar(pbar, i)

    ticker <- df$symbol[i]
    src_url <- paste0(url, ticker, "/")

    pred_rank <- get_text(src_url, xpath = xpath_txt)

    if (identical(pred_rank, character(0))) df$predictability[i] <- NA
    else df$predictability[i] <- substr(pred_rank, 1, 1)
  }

  return(df)

}
