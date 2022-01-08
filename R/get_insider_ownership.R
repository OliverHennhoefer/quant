#' Scrapes diluted earnings of the previous five fiscal years and current earn-
#' ings (TTM) provided by the fundamentals section from gurufocus.com/stock.
#' The results will get merged into existing data with previously scraped earn-
#' ings.
#'
#' @return get_earnings() returns the provided data.frame with the additional
#' column (numeric) 'EPS_20XX' and 'EPS_TTM'.
#'
#' @example
#' stock_earnings <- get_earnings(stocks)
#'
get_insider_ownership <- function(df) {
  check_sanity(df)

  df$insider_ownership <- NA
  rows <- nrow(df)
  pbar <- utils::txtProgressBar(0, rows, style = 3)

  for(i in 1:rows) {
    utils::setTxtProgressBar(pbar, i)

    ticker <- df$Symbol[i]
    url <- paste0("https://www.gurufocus.com/term/InsiderOwnership/", ticker, "/")
    xpath <- '//*[@id="def_body_detail_height"]/font'
    ttm <- get_html_text(url, xpath = xpath)

    extr_str <- gsub("\\s*\\([^\\)]+\\)", "\\1", ttm)
    df$insider_ownership[i] <- as.numeric(gsub("[^0-9.-]+", "\\1", extr_str))
  }

  return(df)
}
