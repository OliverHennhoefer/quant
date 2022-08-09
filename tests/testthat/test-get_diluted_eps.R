test_that("Diluted EPS check", {
  df <- data.frame("symbol" = "AAPL")
  diluted_eps <- quant::get_diluted_eps(df)
  testthat::expect_equal(dim(diluted_eps), c(1,7))
})
