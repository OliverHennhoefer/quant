get_cogs2rev <- function(df) {

  pfx <- 'cogs2rev'
  url <- 'https://www.gurufocus.com/term/cogs2rev/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  # Cost of Goods Sold to Revenue-----------------------------------------------
  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
