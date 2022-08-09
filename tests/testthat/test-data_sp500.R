test_that("SP500 object check", {
  sp500 <- quant::data_sp500()
  testthat::expect_true(data.table::is.data.table(sp500))
})

test_that("SP500 column check", {
  sp500 <- quant::data_sp500()
  testthat::expect_equal(ncol(sp500), 4)
})

test_that("SP500 row check", {
  sp500 <- quant::data_sp500()
  testthat::expect_gt(nrow(sp500), 490) # index amount may vary temporarily
})
