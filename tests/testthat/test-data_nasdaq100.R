test_that("Nasdaq100 object check", {
  nasdaq <- quant::data_nasdaq100()
  testthat::expect_true(data.table::is.data.table(nasdaq))
})

test_that("Nasdaq100 column check", {
  nasdaq <- quant::data_nasdaq100()
  testthat::expect_equal(ncol(nasdaq), 4)
})

test_that("Nasdaq100 row check", {
  nasdaq <- quant::data_nasdaq100()
  testthat::expect_gt(nrow(nasdaq), 95)
})
