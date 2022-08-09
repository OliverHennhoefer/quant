test_that("Financial Distress check", {
  df <- data.frame("symbol" = "AAPL")
  financial_distress <- quant::get_financial_distress(df)
  testthat::expect_equal(dim(financial_distress), c(1,2))
})
