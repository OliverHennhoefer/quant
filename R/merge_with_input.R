#' Merges the initial input input.frame and removes duplicates in either row or
#' column
merge_with_input <- function(new_data = NULL, input = NULL, kpi) {
  new_data[2:ncol(new_data)] <- lapply(2 : ncol(new_data),
                                       function(x) as.numeric(new_data[[x]]))
  colnames(new_data)[1] <- "Symbol"
  
  input <- merge(input, new_data, by = "Symbol", suffixes = rep("", 2))
  input <- input[, !duplicated(colnames(input))]
  
  kpi <- input[colnames(input) %like% kpi]
  input <- input[!apply(kpi, 1, function(x) sum(is.na(x))) > 3, ]
  input <- input[!duplicated(input$Symbol), ]
  
  return(input)
}
