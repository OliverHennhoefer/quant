test_that("Beneish M check", {
  df <- data.frame("symbol" = "AAPL")
  beneish_m <- quant::get_beneish_m(df)
  testthat::expect_equal(dim(beneish_m), c(1,7))
})
