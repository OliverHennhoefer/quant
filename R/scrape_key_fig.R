#' @title Get key figure from gurufocus.com
#'
#' Main internal **'quant'**-function for scraping stock key figures from
#' [gurufocus.com](https://www.gurufocus.com/new_index/)
#'
#' @usage scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl)
#'
#' @param df data.frame. Data frame with a column 'symbol' containing at least
#' one valid stock ticker symbol.
#'
#' @param url String. The Uniform Resource Locator of the resource of interest.
#'
#' @param pfx String. Prefix for column names of scraped data sets.
#'
#' @param xpath_txt String. The XML path to a text element of interest.
#'
#' @param xpath_tbl String. The XML path to a table element of interest.
#'
#' @return
#' The input data frame supplemented by a company's respective key figure value
#' of the last five fiscal years plus current years TTM.
#'
scrape_key_fig<- function(df, url, pfx, xpath_txt = NULL, xpath_tbl = NULL) {

  sanity(df)

  cdf <- data.frame()
  rows <- nrow(df)
  pbar <- utils::txtProgressBar(min = 0, max = rows, style = 3)

  # Ticker Iteration -----------------------------------------------------------
  for(i in 1:rows) {
    utils::setTxtProgressBar(pbar, i)

    ticker <- df$symbol[i]
    src_url <- paste0(url, ticker, "/")

    ## Scrape table data -------------------------------------------------------
    table <- get_table(src_url, xpath = xpath_tbl, name = paste0(pfx, "_20"))

    ## Scrape text data (TTM) --------------------------------------------------
    ttm <- get_text(src_url, xpath_txt)

    ## Text processing ---------------------------------------------------------
    ex_num <- regex_ttm(ttm)
    df_num <- data.frame(ex_num)
    colnames(df_num) <- paste0(pfx, "_ttm")

    ## Bind text and table -----------------------------------------------------
    table <- cbind(ticker, table, df_num)
    colnames(table)[1] <- "symbol"

    ## Check for outdated dataF -------------------------------------------------
    if (topicality(table)) {
      table <- data.frame("symbol" = ticker, "ttm" = NA)
      names(table)[2] <- paste0(pfx, "_ttm")
    }

    ## Slot data together ------------------------------------------------------
    cdf <- plyr::rbind.fill(cdf, table)
  }

  # Merge scraped data with given data frame -----------------------------------
  res <- input_merge(df = cdf, input = df)
  return(res)

}
