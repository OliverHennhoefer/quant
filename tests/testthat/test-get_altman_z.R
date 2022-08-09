test_that("Altman Z check", {
  df <- data.frame("symbol" = "AAPL")
  altman <- quant::get_altman_z(df)
  testthat::expect_equal(dim(altman), c(1,7))
})
