#' Scrapes the monthly stock trading volume provided by the stock summary from 
#' gurufocus.com/stock. The function serves mainly the purpose of cleaning the
#' resulting data.frame of getStocksList() from delisted stocks or duplicates
#' stemming from non-primary listings of the respective stocks for which no 
#' financial information is provided.
#' Enables the application of following functions with increased performance.
#'  
#' @return get_trading_volume() returns provided data.frame with the additional
#' column (char) 'Volume' providing monthly stock trading volume at respective
#' stock exchange.
#' 
#' @example 
#' stock_volume <- get_trading_volume(stock_list)
#' 
get_trading_volume <- function(df) {
  sanity_check(df)
  
  df$Volume <- NA
  rows <- nrow(df)
  pbar <- utils::txtProgressBar(0, rows, style = 3)
  
  for(i in 1:rows) {
    utils::setTxtProgressBar(pbar, i)
    
    ticker <- df$Symbol[i]
    
    url <- paste0("https://www.gurufocus.com/stock/", ticker, "/summary")
    xpath <- '//*[@id="stock-header"]/div/div[1]/div/div[3]/div[4]'
    volume <- get_html_text(url, xpath = xpath)

    volume <- gsub(' ', '', gsub(',', '', volume))
    if( volume == 0) volume <- NA
    df$Volume[i] <- as.numeric(volume)
  }
  
  return(df)
}