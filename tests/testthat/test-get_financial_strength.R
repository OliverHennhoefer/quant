test_that("Financial Strength check", {
  df <- data.frame("symbol" = "AAPL")
  financial_strength <- quant::get_financial_strength(df)
  testthat::expect_equal(dim(financial_strength), c(1,2))
})
