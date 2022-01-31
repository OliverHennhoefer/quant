get_epsd <- function(df) {

  pfx <- 'epsd'
  url <- 'https://www.gurufocus.com/term/per+share+eps/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  # Earnings per Share Diluted -------------------------------------------------
  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
