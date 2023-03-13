testthat::test_that("cat_pandoc_fig works", {
  # validity checks
  expect_error(
    quartorsv_cat_pandoc_fig("test.png")
  )
  # check that it can run
  expect_identical(
    quartorsv_cat_pandoc_fig(
      "test.png",
      force_cross_ref = FALSE,
      force_exists = FALSE
    ),
    "![](test.png)"
  )
  Sys.setenv("QUARTORSV_TESTING" = "TRUE")
  # check that it errors if file exists
  # but isn't cross-referenceable
  png("test.png")
  hist(rnorm(10))
  dev.off()
  expect_error(
    quartorsv_cat_pandoc_fig(
      "test.png"
    )
  )
  expect_error(
    quartorsv_cat_pandoc_fig(
      "test.png",
      cap = "Test figure"
    )
  )
  expect_identical(
    quartorsv_cat_pandoc_fig(
      "test.png",
      cap = "Test figure",
      label = "test-fig"
    ),
    "![Test figure](test.png){#fig-test-fig}"
  )
  expect_identical(
    quartorsv_cat_pandoc_fig(
      "test.png",
      cap = "Test figure",
      label = "#fig-test-fig"
    ),
    "![Test figure](test.png){#fig-test-fig}"
  )
  # check with arguments
  expect_identical(
    quartorsv_cat_pandoc_fig(
      "test.png",
      cap = "Test figure",
      label = "#fig-test-fig",
      args = "do you even lift bro"
    ),
    "![Test figure](test.png){#fig-test-fig do you even lift bro}"
  )
  invisible(file.remove("test.png"))
  Sys.unsetenv("QUARTORSV_TESTING")
})
