get_ebitdaps <- function(df) {

  pfx <- 'ebitdaps'
  url <- 'https://www.gurufocus.com/term/EBITDA_per_share/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  # EBITDA per Share------------------------------------------------------------
  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
