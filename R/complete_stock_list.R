#' Scrapes the stock list provided by https://www.gurufocus.com/stock_list.php
#' in order to get ticker symbols and corresponding company names of every stock
#' available on gurufocus.com.
#'
#' @importFrom data.table as.data.table data.table
#' @importFrom rvest read_html html_nodes html_table
#' @importFrom utils setTxtProgressBar txtProgressbar
#'
#' @return get_stock_list() returns data.frame with the columns (char) 'Symbol'
#' and "Company" containing ticker symbol and full name of the public company.
#'
#' @example
#' stock_list <- get_stock_list()
#'
complete_stock_list <- function() {
  library(utils)
  library(rvest)
  library(data.table)

  # total of stocks on website for progress bar
  url <- "https://www.gurufocus.com/stock_list.php?&p=1&n=100"
  xpath <- '//*[@id="ajax_content"]/div/div[3]/strong'
  listings <- get_html_text(url, xpath) #list size

  count <- round(as.numeric(listings)/100, -2) #divisibility progress bar
  pbar <- utils::txtProgressBar(0, count, style = 3)

  i = 1
  df <- data.table::data.table(NULL)
  while(TRUE) {

    url <- paste0("https://www.gurufocus.com/stock_list.php?&p=", i, "&n=100")
    setTxtProgressBar(pbar, i)
    i = i + 1

    page_table <- get_html_table(url, xpath = '//*[@id="R1"]', raw = TRUE)
    if(nrow(page_table) == 0) break
    page_table <- page_table[, 1:2] #retain only ticker and company name

    df <- rbind(df, page_table)
  }

  close(pbar)
  return(df)
}
