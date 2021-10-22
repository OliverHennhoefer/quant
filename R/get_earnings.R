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
get_earnings <- function(df) {
  check_sanity(df)

  dfe <- data.frame()
  rows <- nrow(df)
  pbar <- utils::txtProgressBar(0, rows, style = 3)

  for(i in 1:rows) {
    utils::setTxtProgressBar(pbar, i)

    ticker <- df$Symbol[i]
    url <- paste0("https://www.gurufocus.com/term/per+share+eps/", ticker, "/")

    xpath <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
    table <- get_html_table(url, xpath = xpath, name = "EPS_20")

    xpath <- '//*[@id="def_body_detail_height"]/font[1]'
    ttmpe <- get_html_text(url, xpath)

    extr_str <- gsub("\\s*\\([^\\)]+\\)", "\\1", ttmpe) #remove paranthesis
    dfc <- data.frame(as.numeric(gsub("[^0-9.-]+", "\\1", extr_str))) #earnings
    colnames(dfc) <- "EPS_TTM"

    pe_table <- cbind(ticker, table, dfc)
    colnames(pe_table)[1] <- "Symbol"

    #removes data older than n+/-5 years from oldest date and corrupted tables
    lim_year <- getFirstYear(table)
    if( lim_year < year(Sys.time()) - 5 |
        lim_year > data.table::year(Sys.time()) + 1 |
        ncol(table) < 2) {
      pe_table <- data.frame("Symbol" = ticker, "EPS_TTM" = NA)
    }

    yr <- gsub("\\D", "\\1", ttmpe)
    if( as.numeric(substr(yr, nchar(yr)-3, nchar(yr))) < year(Sys.time())-3) {
      pe_table <- data.frame("Symbol" = ticker, "EPS_TTM" = NA)
    }

    dfe <- plyr::rbind.fill(dfe, pe_table)
  }

  df <- combine_data(res = dfe, data = df, kpi = "EPS")
  return(df)
}
