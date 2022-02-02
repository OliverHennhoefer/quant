get_interest_coverage <- function(df) {

  pfx <- 'interest_coverage'
  url <- 'https://www.gurufocus.com/term/interest_coverage/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  # Interest Coverage ----------------------------------------------------------
  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
