get_profitability <- function(df) {

  url <- 'https://www.gurufocus.com/term/rank_profitability/'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  # Profitability Rank ---------------------------------------------------------
  res <- suppressWarnings(scrape_profitability(df, url, xpath_txt))

  return(res)
}
