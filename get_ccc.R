get_ccc <- function(df) {

  pfx <- 'cash.conv.cycle'
  url <- 'https://www.gurufocus.com/term/CCC/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  # Cash Conversion Cycle ------------------------------------------------------
  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
