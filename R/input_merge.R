#' @title Merge original data frame with scraped data
#'
#' Internal function. Merges data.frame resulting from web scraping to the
#' data.frame provided as input of a respective function.
#'
#' @param df Data.frame. A data.frame to be merged to the original input.
#'
#' @param input Data.frame. A data.frame provided as original function input.
#'
#' @example
#' df <- data.frame("symbol" = "STOCK", "eps_2016" = 99)
#' input <- data.frame("symbol" = "STOCK", "eps_2016" = 99, "eps_2017" = 199)
#' input_merge(df = df, input = input)
input_merge <- function(df = NULL, input = NULL) {

  # Convert columns to integer -------------------------------------------------
  df[2:ncol(df)] <- lapply(2 : ncol(df), function(x) as.numeric(df[[x]]))
  colnames(df)[1] <- 'symbol'

  # Merge scraped dfa with input dfa -------------------------------------------
  input <- merge(input, df, by = "symbol", suffixes = rep("", 2))

  # Clean merged dfa -----------------------------------------------------------
  #input <- input[, !duplicated(colnames(input))]
  #input[, .SD, .SDcols = unique(names(input))]

  # Remove insufficient row dfa from scraped KPI -------------------------------
  #kpi <- sub("\\_.*", "", colnames(df)[2])
  #kpi_col <- input[,data.table::like(names(input), "sector"), with = FALSE]

  ##kpi_col <- input[data.table::like(colnames(input), kpi)]
  ##input <- input[!apply(kpi_col, 1, function(x) sum(is.na(x))) > 3, ]
  ##input <- input[!duplicated(input$symbol), ]

  # Sort columns ---------------------------------------------------------------
  input.first <- input[, 1, drop = FALSE] #Keep 'symbol' in first columns
  input.rest <- input[, -1]
  input <- cbind(input.first, input.rest[ , order(names(input.rest))])

  input$remove <- NULL
  #input <- within(input, rm("remove"))

  return(input)
}


