get_inv2rev <- function(df) {

  pfx <- 'inventory2rev'
  url <- 'https://www.gurufocus.com/term/inventory2rev/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  # Inventory to Revenue Ratio -------------------------------------------------
  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
