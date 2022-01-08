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

  dfe <- data.frame()
  rows <- nrow(df)
  pbar <- utils::txtProgressBar(0, rows, style = 3)

  for(i in 1:rows) {
    utils::setTxtProgressBar(pbar, i)

    ticker <- df$Symbol[i]
    url <- paste0("https://www.gurufocus.com/term/InsiderOwnership/", ticker, "/")

    xpath = '//*[@id="target_def_historical_data"]/div[2]/table'
    table <- get_html_table(url, xpath = xpath, raw = TRUE)[, -1]

    xpath = '//*[@id="def_body_detail_height"]/font'
    ttm <- get_html_text(url, xpath = xpath)
    extr_str <- gsub("\\s*\\([^\\)]+\\)", "\\1", ttm)
    cval <- as.numeric(gsub("[^0-9.-]+", "\\1", extr_str))

    if (any(dim(table) == FALSE)) {
      ic_table <- data.frame("Symbol" = ticker, "insider_ownership_ttm" = cval)
    } else {
      colnames(table) <- gsub("-", "_", paste0("insider_ownership_", table[1, ]))
      table <- table[-1, ]

      dfc <- data.frame(cval)
      colnames(dfc) <- "insider_ownership_ttm"
      ic_table <- cbind(ticker, table, dfc)
      colnames(ic_table)[1] <- "Symbol"
    }

    dfe <- plyr::rbind.fill(dfe, ic_table)
    print(dfe)
  }

  df <- merge_with_input(new_data = dfe, input = df, kpi = "insider_ownership")
  return(df)
}
