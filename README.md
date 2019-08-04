
<!-- README.md is generated from README.Rmd. Please edit that file -->

# add2gh

<!-- badges: start -->

<!-- badges: end -->

The goal of add2gh is to help R users collect data from
GitHub.

## Installation

<!-- You can install the released version of add2gh from [CRAN](https://CRAN.R-project.org) with: -->

<!-- ``` r -->

<!-- install.packages("add2gh") -->

<!-- ``` -->

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("JiaxiangBU/add2gh")
```

## Example

``` r
library(add2gh)
```

``` r
suppressWarnings(collect_comments("https://github.com/JiaxiangBU/add2gh/issues/2"))
#> Requests will authenticate with GITHUB_PAT
#> Test Body
#> 
#> Test Comments
```

-----

<h4 align="center">

**Code of Conduct**

</h4>

<h6 align="center">

Please note that the `add2gh` project is released with a [Contributor
Code of Conduct](.github/CODE_OF_CONDUCT.md).<br>By contributing to this
project, you agree to abide by its terms.

</h6>

<h4 align="center">

**License**

</h4>

<h6 align="center">

MIT © [Jiaxiang Li](LICENSE.md)

</h6>
