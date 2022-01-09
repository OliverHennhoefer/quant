#' Scrapes origin (country) of respective stock as provided byy the stock summary
#' from gurufocus.com/stock.
#'
#' @return get_country() returns the provided data.frame with the additional
#' column (char) 'Country'.
#'
#' @example
#' stock_country <- get_country(stocks)
get_profitability <- function(df) {
  check_sanity(df)

  df$profitability_rank <- NA
  rows <- nrow(df)
  pbar <- utils::txtProgressBar(0, rows, style = 3)

  for(i in 1:rows) {

    utils::setTxtProgressBar(pbar, i)

    ticker <- df$Symbol[i]
    url <- paste0("https://www.gurufocus.com/term/rank_profitability/", ticker, "/")

    xpath <- '//*[@id="def_body_detail_height"]/font[1]'
    fin_dis <- get_html_text(url, xpath = xpath)

    extr_str <- gsub("\\s*\\([^\\)]+\\)", "\\1", fin_dis)
    df$profitability_rank[i] <- as.numeric(gsub("[^0-9.-]+", "\\1", extr_str))
  }

  return(df)
}
