test_that("E10 check", {
  df <- data.frame("symbol" = "AAPL")
  e10 <- quant::get_e10(df)
  testthat::expect_equal(dim(e10), c(1,7))
})
