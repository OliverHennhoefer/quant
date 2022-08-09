test_that("Equity to Assets check", {
  df <- data.frame("symbol" = "AAPL")
  equity_to_assets <- quant::get_equity_to_assets(df)
  testthat::expect_equal(dim(equity_to_assets), c(1,7))
})
