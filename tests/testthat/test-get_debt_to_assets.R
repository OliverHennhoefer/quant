test_that("Debt to Asset Ratio check", {
  df <- data.frame("symbol" = "AAPL")
  debt_to_assets <- quant::get_debt_to_assets(df)
  testthat::expect_equal(dim(debt_to_assets), c(1,7))
})
