get_ncav <- function(df) {

  pfx <- 'ncav'
  url <- 'https://www.gurufocus.com/term/NCAV_real/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  # Net Current Asset Value-----------------------------------------------------
  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
