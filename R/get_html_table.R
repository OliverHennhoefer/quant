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
get_html_table <- function(url, xpath = NULL, name = NULL, raw = FALSE) {

  table <- rvest::read_html(url) %>%
    rvest::html_nodes(xpath = xpath) %>%
    rvest::html_table() %>%
    data.table::as.data.table()

  if (ncol(table) == 0) return(data.frame("remove" = TRUE))
  if (raw) return(table)

  table <- table[2:3, ] #remove header row
  colnames(table) <- paste0(name,
                            substr(table[1, ],
                                   nchar(table[1, ]) - 1,
                                   nchar(table[1, ])) #add prefix to colnames
                            )
  table[table == "-" | table == ""] <- NA
  table <- table[-1, as.logical(!colSums(is.na(table)) > 0), with = FALSE]

  return(table)
}
