test_that("Checking scrape_key_fig() return data.frame", {
  expect_equal(
      scrape_key_fig(df = data.frame("symbol" = c("AAPL", "BABA", "PNGAY", "LMT")),
                     url = 'https://www.gurufocus.com/term/zscore/',
                     pfx = "zscore",
                     xpath_txt = '//*[@id="def_body_detail_height"]/font[1]',
                     xpath_tbl = '//*[@id="target_def_historical_data"]/div[2]/div/table')[3,3],
    expected = 3.11)
})
