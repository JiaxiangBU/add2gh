
<!-- README.md is generated from README.Rmd. Please edit that file -->

# add2gh

<!-- badges: start -->

[![DOI](https://zenodo.org/badge/190434114.svg)](https://zenodo.org/badge/latestdoi/190434114)
<!-- badges: end -->

The goal of add2gh is to use GitHub API with
R.

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

## Citations

Jiaxiang Li. (2019, August 4). JiaxiangBU/add2gh: add2gh 0.1.0 (Version
v0.1.0). Zenodo. <http://doi.org/10.5281/zenodo.3359736>

``` bibtex
@misc{jiaxiang_li_2019_3359736,
  author       = {Jiaxiang Li},
  title        = {JiaxiangBU/add2gh: add2gh 0.1.0},
  month        = aug,
  year         = 2019,
  doi          = {10.5281/zenodo.3359736},
  url          = {https://doi.org/10.5281/zenodo.3359736}
}
```

If you use add2gh, I would be very grateful if you can add a citation in
your published work. By citing add2gh, beyond acknowledging the work,
you contribute to make it more visible and guarantee its growing and
sustainability. For citation, please use the BibTex or the citation
content.

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
