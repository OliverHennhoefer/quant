check_table_topicality <- function(table, ticker, ttm.name = "TTM") {
  yooe <- year_of_oldest_entry(table)
  
  if( yooe < year(Sys.time()) - 5 |
      yooe > data.table::year(Sys.time()) + 1 |
      ncol(table) < 2
  ) {pe_table <- data.frame(ticker, ttn.name = NA)}
}

year_of_oldest_entry <- function(table = NULL) {
  fyr <- colnames(table)[1]
  lim_year <- as.numeric(substr(fyr, nchar(fyr) - 4 + 1, nchar(fyr)))
  return(lim_year)
}