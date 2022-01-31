#' Get HTML table element
#'
#' @param url String. The Uniform Resource Locator of the resource of interest.
#'
#' @param xpath String. The XML path to an element of interest.
#'
#' @param name String. The prefix preceding every scraped output column.
#'
#' @param raw Logical. Controls whether 'gurufocus.com'-specific data processing
#' shall be applied to the table.
#'
#' @examples
#' get_table(url = 'https://www.gurufocus.com/term/cash_per_share/AAPL/',
#'          xpath = '//*[@id="target_def_historical_data"]/div[2]/div/table')
#'
#' @return The table to be found under the given XML path and URL.
#'
get_table <- function(url, xpath, name, raw = FALSE) {

  # Scrape annual data table ---------------------------------------------------
  html_page <- rvest::read_html(url)
  html_node <- rvest::html_nodes(html_page, xpath = xpath)
  html_tbl <- rvest::html_table(html_node)
  html_dt <- data.table::as.data.table(html_tbl)

  if (ncol(html_dt) == 0) return(data.frame("remove" = TRUE))

  if (raw) return(html_dt[, -1])

  # Clean annual data table ----------------------------------------------------
  dat_tbl <- html_dt[-1, ] # Remove header

  colnames(dat_tbl) <- paste0(name,
                            substr(dat_tbl[1, ],
                            nchar(dat_tbl[1, ]) - 1,
                            nchar(dat_tbl[1, ]))) # Add column name prefix

  dat_tbl[dat_tbl == "-" | dat_tbl == ""] <- NA

  dat_col <- as.logical(!colSums(is.na(dat_tbl)) > 0) #keep columns unequal NA
  #dat_res <- dat_tbl[-1, dat_col, with = FALSE]
  dat_res <- dat_tbl[-1, dat_col, drop = FALSE]
  colnames(dat_res) <- colnames(dat_tbl)[dat_col]

  return(dat_res)
}
