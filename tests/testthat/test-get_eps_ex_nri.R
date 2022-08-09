test_that("EPS ex NRI check", {
  df <- data.frame("symbol" = "AAPL")
  eps_ex_nri <- quant::get_eps_ex_nri(df)
  testthat::expect_equal(dim(eps_ex_nri), c(1,7))
})
