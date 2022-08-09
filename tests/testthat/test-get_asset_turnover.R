test_that("Asset Turnover check", {
  df <- data.frame("symbol" = "AAPL")
  asset_turnover <- quant::get_asset_turnover(df)
  testthat::expect_equal(dim(asset_turnover), c(1,7))
})
