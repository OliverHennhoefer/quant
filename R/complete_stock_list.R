#' Scrapes the stock list provided by https://www.gurufocus.com/stock_list.php
#' in order to get ticker symbols and corresponding company names of every stock
#' available on gurufocus.com.
#'
#'
#' @return get_stock_list() returns data.frame with the columns (char) 'Symbol'
#' and "Company" containing ticker symbol and full name of the public company.
#'
#' @example
#' stock_list <- get_stock_list()
#'
complete_stock_list <- function() {

  # total of stocks on website for progress bar
  url <- "https://www.gurufocus.com/stock_list.php?&p=1&n=100"
  xpath <- '//*[@id="ajax_content"]/div/div[3]/strong'
  listings <- get_html_text(url, xpath)

  count <- round(as.numeric(listings)/100, -2) #for divisibility
  pbar <- utils::txtProgressBar(0, count, style = 3)

  i = 1
  df <- data.table::data.table(NULL)
  while(TRUE) {

    page <- paste0("https://www.gurufocus.com/stock_list.php?&p=", i, "&n=100")
    utils::setTxtProgressBar(pbar, i)
    i = i + 1

    page_table <- rvest::read_html(page) %>%
      rvest::html_nodes(xpath = '//*[@id="R1"]') %>%
      rvest::html_table() %>%
      data.table::as.data.table()

    page_table <- page_table[, 1:2] #keep ticker and company

    if(nrow(page_table) == 0) break
    df <- rbind(df, page_table)
  }

  close(pbar)
  return(df)
}
