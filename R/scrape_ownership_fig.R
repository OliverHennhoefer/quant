#' Get key figure from gurufocus.com
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
scrape_ownership_fig<- function(df, url, pfx, xpath_txt, xpath_tbl) {

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
    table <- get_table(src_url, xpath = xpath_tbl,
                       name = paste0(pfx, "_20"),
                       raw = T)
    colnames(table) <- as.character(table[1, ])
    table <- table[-1,]

    ## Scrape text data (TTM) --------------------------------------------------
    ttm <- get_text(src_url, xpath_txt)

    ## Text processing ---------------------------------------------------------
    ex_num <- regex_ttm(ttm)

    ## Check for outdated data -------------------------------------------------
    if (is.null(dim(table)) || length(table) == 0) {
      otable <- data.frame("symbol" = ticker, "ttm" = ex_num)
      colnames(otable)[2] <- paste0(pfx, "_ttm")
    } else {
      colnames(table) <- gsub("-", "_", paste0(pfx, "_", colnames(table)))

      df_ttm <- data.frame(ex_num)
      colnames(df_ttm) <- paste0(pfx, "_ttm")
      otable <- cbind(ticker, table, df_ttm)
      colnames(otable)[1] <- "symbol"
    }

    ## Slot data together ------------------------------------------------------
    cdf <- plyr::rbind.fill(cdf, otable)
  }

  # Merge scraped data with given data frame -----------------------------------
  res <- quant::input_merge(df = cdf, input = df)
  return(res)

}
