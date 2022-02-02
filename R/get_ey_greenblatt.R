get_ey_greenblatt <- function(df) {

  pfx <- 'earning_yield_greenblatt'
  url <- 'https://www.gurufocus.com/term/earning_yield_greenblatt/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  # Eanings Yield (Joel Greenblatt) % ------------------------------------------
  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
