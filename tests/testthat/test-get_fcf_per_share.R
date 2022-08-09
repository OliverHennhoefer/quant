test_that("FCF per Share check", {
  df <- data.frame("symbol" = "AAPL")
  fcf_per_share <- quant::get_fcf_per_share(df)
  testthat::expect_equal(dim(fcf_per_share), c(1,7))
})
