test_that("EBIT per Share check", {
  df <- data.frame("symbol" = "AAPL")
  ebit_per_share <- quant::get_ebit_per_share(df)
  testthat::expect_equal(dim(ebit_per_share), c(1,7))
})
