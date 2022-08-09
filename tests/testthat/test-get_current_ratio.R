test_that("Current Ratio check", {
  df <- data.frame("symbol" = "AAPL")
  current_ratio <- quant::get_current_ratio(df)
  testthat::expect_equal(dim(current_ratio), c(1,7))
})
