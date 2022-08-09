test_that("EV to Revenue check", {
  df <- data.frame("symbol" = "AAPL")
  ev_to_revenue <- quant::get_ev_to_revenue(df)
  testthat::expect_equal(dim(ev_to_revenue), c(1,7))
})
