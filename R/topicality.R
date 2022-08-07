#' @title Merge original data frame with scraped data
#'
#' Internal function. Merges data.frame resulting from web scraping to the
#' data.frame provided as input of a respective function.
#'
#' @param table Data.frame
#'
#' @examples
#' df <- data.frame("symbol" = "STOCK", "eps_2016" = 99)
#' topicality(df)
#' @export
topicality <- function(table) {

  # Check whether available data is outdated -----------------------------------
  table_years <- colnames(x = table)[2]
  if (identical(table_years, "remove")) return(FALSE) #remove tag (s. get_table)

  oldest_year <- as.numeric(substr(x = table_years,
                                   start = nchar(table_years) - 3,
                                   stop = nchar(table_years)))
  if(is.na(oldest_year)) return(FALSE)

  year_now <- data.table::year(Sys.time())

  if( oldest_year < (year_now - 6) | # oldest table year not older than six yrs
      oldest_year > (year_now + 1) | # oldest table year not in the future
      ncol(table) < 2) {             # number table columns > 2
    return(TRUE)
  } else {
    return(FALSE)
  }

}
