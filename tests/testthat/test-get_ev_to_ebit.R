test_that("EV to EBIT check", {
  df <- data.frame("symbol" = "AAPL")
  ev_to_ebit <- quant::get_ev_to_ebit(df)
  testthat::expect_equal(dim(ev_to_ebit), c(1,7))
})
