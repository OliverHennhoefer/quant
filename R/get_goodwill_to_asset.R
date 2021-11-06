#' Scrapes the F-Score (Piotroski Score) of the previous five fiscal years and
#' current F-Score (TTM) provided by the fundamentals section from gurufocus.com.
#' The results will get merged into existing data with previously scraped earn-
#' ings.
#'
#' @return get_fscore() returns the provided data.frame with the additional
#' column (numeric) 'FScore_20XX' and 'FScore_TTM'.
#'
#' @example
#' stock_piotroski <- get_fscore(stocks)
#'
get_goodwill_to_asset <- function(df) {
  check_sanity(df)

  dfe <- data.frame()
  rows <- nrow(df)
  pbar <- utils::txtProgressBar(0, rows, style = 3)

  for(i in 1:rows) {
    utils::setTxtProgressBar(pbar, i)

    ticker <- df$Symbol[i]
    url <- paste0("https://www.gurufocus.com/term/goodwill2asset/",
                  ticker, "/")

    xpath = '//*[@id="target_def_historical_data"]/div[2]/div/table'
    table <- get_html_table(url, xpath = xpath, name = "Goodwill2Asset_20")

    xpath = '//*[@id="def_body_detail_height"]/font[1]'
    ttmpe <- get_html_text(url, xpath)

    ttm_year <- gsub("\\D", "\\1", ttmpe)[[1]]
    cval <- gsub("\\s*\\([^\\)]+\\)", "\\1", ttmpe) #remove paranthesis
    cval <- as.numeric(gsub("[^0-9.-]+", "\\1", cval)) #earnings w\o currency

    dfc <- data.frame(cval)
    colnames(dfc) <- "Goodwill2Asset_TTM"
    ic_table <- cbind(ticker, table, dfc)
    colnames(ic_table)[1] <- "Symbol"

    if (check_table_topicality(table, ttmpe))
    { ic_table <- data.frame("Symbol" = ticker, "Goodwill2Asset_TTM" = NA) }

    dfe <- plyr::rbind.fill(dfe, ic_table)
  }

  df <- merge_with_input(new_data = dfe, input = df, kpi = "Goodwill2Asset")
  return(df)
}
