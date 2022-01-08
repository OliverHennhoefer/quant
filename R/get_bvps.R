get_bvps <- function(df) {
  check_sanity(df)

  dfe <- data.frame()
  rows <- nrow(df)
  pbar <- utils::txtProgressBar(0, rows, style = 3)

  for(i in 1:rows) {
    utils::setTxtProgressBar(pbar, i)

    ticker <- df$Symbol[i]
    url <- paste0("https://www.gurufocus.com/term/Book+Value+Per+Share/", ticker, "/")

    xpath <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
    table <- get_html_table(url, xpath = xpath, name = "bvps_20")

    xpath <- '//*[@id="def_body_detail_height"]/font[1]'
    ttmpe <- get_html_text(url, xpath)

    extr_str <- gsub("\\s*\\([^\\)]+\\)", "\\1", ttmpe) #remove paranthesis
    dfc <- data.frame(as.numeric(gsub("[^0-9.-]+", "\\1", extr_str))) #earnings
    colnames(dfc) <- "bvps_TTM"

    pe_table <- cbind(ticker, table, dfc)
    colnames(pe_table)[1] <- "Symbol"

    if (check_table_topicality(table, ttmpe))
    { pe_table <- data.frame("Symbol" = ticker, "bvps_TTM" = NA) }

    dfe <- plyr::rbind.fill(dfe, pe_table)
  }

  df <- merge_with_input(new_data = dfe, input = df, kpi = "bvps")
  return(df)
}
