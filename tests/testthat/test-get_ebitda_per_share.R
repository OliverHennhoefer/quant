test_that("EBITDA per Share check", {
  df <- data.frame("symbol" = "AAPL")
  ebitda_per_share <- quant::get_ebitda_per_share(df)
  testthat::expect_equal(dim(ebitda_per_share), c(1,7))
})
