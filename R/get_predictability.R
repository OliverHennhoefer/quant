#' Scrapes origin (country) of respective stock as provided byy the stock summary
#' from gurufocus.com/stock.
#'
#' @return get_country() returns the provided data.frame with the additional
#' column (char) 'Country'.
#'
#' @example
#' stock_country <- get_country(stocks)
get_predictability <- function(df) {
  check_sanity(df)

  df$predictability_rank <- NA
  rows <- nrow(df)
  pbar <- utils::txtProgressBar(0, rows, style = 3)

  for(i in 1:rows) {
    utils::setTxtProgressBar(pbar, i)

    ticker <- df$Symbol[i]
    url <- paste0("https://www.gurufocus.com/term/predictability_rank/", ticker, "/")
    xpath <- '//*[@id="target_def_description"]/div/span'

    pred_rank <- get_html_text(url, xpath = xpath)

    if (identical(pred_rank, character(0))) df$predictability_rank[i] <- NA
    else df$predictability_rank[i] <- substr(pred_rank, 1, 1)
  }

  return(df)
}
