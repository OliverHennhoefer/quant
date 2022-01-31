get_predictability <- function(df) {

  url <- 'https://www.gurufocus.com/term/predictability_rank/'
  xpath_txt <- '//*[@id="target_def_description"]/div/span'

  # Predictability Rank --------------------------------------------------------
  res <- suppressWarnings(scrape_predictability(df, url, xpath_txt))

  return(res)
}
