get_inventory_turnover <- function(df) {

  pfx <- 'inventory_turnover'
  url <- 'https://www.gurufocus.com/term/InventoryTurnover/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  # Inventory Turnover ---------------------------------------------------------
  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
