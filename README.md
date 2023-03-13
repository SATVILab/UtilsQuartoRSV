
<!-- README.md is generated from README.Rmd. Please edit that file -->

# UtilsQuartoRSV

<!-- badges: start -->

[![R-CMD-check](https://github.com/SATVILab/UtilsQuartoRSV/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/SATVILab/UtilsQuartoRSV/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/SATVILab/UtilsQuartoRSV/branch/main/graph/badge.svg)](https://app.codecov.io/gh/SATVILab/UtilsQuartoRSV?branch=main)
<!-- badges: end -->

The goal of UtilsQuartoRSV is to provide utility functions to assist
`Quarto` document creation when using `R`.

## Installation

You can install the development version of UtilsQuartoRSV like so:

``` r
devtools::install_github("SATVILab/UtilsQuartoRSV")
```

## Examples

``` r
library(UtilsQuartoRSV)
## basic example code
```

### Pandoc syntax for including figures, tables and other elements

``` r
quartorsv_cat_pandoc_fig(
  path = "path/to/fig.png",
  cap = "Incredible hist() plot",
  label = "hist-plot",
  args = "width=50%",
  force_exists = FALSE
)
#> ![Incredible hist() plot](path/to/fig.png){#fig-hist-plot width=50%}
```
