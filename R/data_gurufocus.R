#' @title
#' Fetch complete stock list
#'
#' @description
#' Fetches the stock list provided by gurufocus.com
#'
#' @return
#' data.table data.frame
#'
#' @example
#' \donttest{stocks <- data_gurufocus()}
#'
#' @export
#'
data_gurufocus <- function() {

  # Prepare Progressbar --------------------------------------------------------
  total_records <- get_text(
    url = 'https://www.gurufocus.com/stock_list.php?&p=1&n=100',
    xpath = '//*[@id="ajax_content"]/div/div[3]/strong')

  count <- round(as.numeric(total_records)/100, digits = -1) #divisibility
  pbar <- utils::txtProgressBar(0, count, style = 3)

  # Fetch Data -----------------------------------------------------------------
  i <- 1
  dat <- data.table::data.table(NULL)
  names <- c("symbol", "company")

  while(TRUE) {
    utils::setTxtProgressBar(pbar, i)
    i <- i + 1

    url <- paste0("https://www.gurufocus.com/stock_list.php?&p=", i, "&n=100")

    html_page <- rvest::read_html(url)
    html_node <- rvest::html_nodes(html_page, xpath = '//*[@id="R1"]')
    html_tbl <- rvest::html_table(html_node)
    html_dt <- data.table::as.data.table(html_tbl)

    html_dt[, (3:ncol(html_dt))] <- NULL
    if(nrow(html_dt) == 0) break

    dat <- data.table::rbindlist(dat, html_dt)
  }
  close(pbar)

  data.table::setnames(dat, names)
  return(dat)
}
