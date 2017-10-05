# Devtools

library(devtools)

# init stuffs
use_data_raw()
use_code_of_conduct()
use_cran_badge()
use_mit_license()
use_news_md()
use_readme_rmd()
use_testthat()
use_travis()

#init tests
use_test("init")

# init vignette
use_vignette("getting started")
build_vignettes()

# dependencies
use_package("assertthat")
use_package("glue")
use_package("htmltools")
use_package("magrittr")
use_package("rvest")


# run tests

test()
build_win()
check()
