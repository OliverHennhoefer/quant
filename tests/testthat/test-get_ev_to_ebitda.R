test_that("EV to EBITDA check", {
  df <- data.frame("symbol" = "AAPL")
  ev_to_ebitda <- quant::get_ev_to_ebitda(df)
  testthat::expect_equal(dim(ev_to_ebitda), c(1,7))
})
