#removes data older than n+/-5 years from oldest date and corrupted tables
check_table_topicality <- function(table, ttmpe) {

  tbl_year <- colnames(table)[1]
  year <- as.numeric(substr(tbl_year, nchar(tbl_year) - 4 + 1, nchar(tbl_year)))
  curr_year <- data.table::year(Sys.time())

  if( year < (curr_year - 5) | year > (curr_year + 1) | ncol(table) < 2)
    { return(TRUE) }

  # ttm_year <- gsub("\\D", "\\1", ttmpe)
  # nchar <- nchar(ttm_year)
  # limit <- data.table::year(Sys.time()) - 3
  #
  # if( as.numeric(substr(ttm_year, nchar - 3, nchar)) < limit)
  #   { return(TRUE) }

  return(FALSE)
}
