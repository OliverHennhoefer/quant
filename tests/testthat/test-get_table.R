test_that("Checking get_table() return class", {
  expect_equal(
    class(
      get_table(url = "https://www.gurufocus.com/term/zscore/PNGAY/",
                xpath = '//*[@id="target_def_historical_data"]/div[2]/div/table',
                name = "altman_20",
                raw = FALSE)),
    expected = "data.frame")
})

# Gurufocus posseses no data about PNGAY (Ping An Insurance) hence the returned
# data.frame only contains a "remove" = TRUE marker.
test_that("Checking get_table() return dimension (empty data.frame)", {
  expect_equal(
    get_table(url = "https://www.gurufocus.com/term/zscore/PNGAY/",
              xpath = '//*[@id="target_def_historical_data"]/div[2]/div/table',
              name = "altman_20",
              raw = FALSE)[,1],
    expected = TRUE)
})
