<!-- README.md is generated from README.Rmd. Please edit that file -->
lexiquer
========

This package is a wrapper around Lexique 3.81, a database for natural language processing in French.

More info on: <http://www.lexique.org>

What's in this db?
------------------

Lexique gives access to ~ 150 000 french words with several annotations: lemme, phoneme, genre, frequency, number of letters, word neighbours...

Getting started
---------------

The full corpus is a data object contained inside the package, which you can call with :

``` r
library(lexiquer)
data("lexique")
```

You can then left join it with a one-word-per-row data.frame:

``` r
library(tidytext)
library(proustr)
library(tidyverse)

sw <- proust_stopwords()
ad <- albertinedisparue

tm <- unnest_tokens(ad, word, text) %>%
  count(word) %>%
  anti_join(sw) 
tm %>%
  left_join(lexique, by = c("word" = "ortho")) %>%
  select(lemme, cgramortho) %>%
  na.omit() %>%
  count(lemme, cgramortho) %>%
  top_n(10, n) %>%
  arrange(desc(n))
#> # A tibble: 12 x 3
#>       lemme cgramortho     n
#>       <chr>      <chr> <int>
#>  1    faire        VER    23
#>  2  trouver        VER    22
#>  3  vouloir        VER    21
#>  4  pouvoir        VER    19
#>  5   savoir        VER    19
#>  6     voir        VER    19
#>  7    venir        VER    18
#>  8  devenir        VER    17
#>  9  prendre        VER    17
#> 10 demander        VER    15
#> 11  laisser        VER    15
#> 12   rester        VER    15
```

### `bind_*` wrappers

`{lexiquer}` provides a series of wrapper to bind specific part of the corpus to your text. See the `bind_*` functions for more details.

For example, you can binf the grammatical category of the word:

``` r
bind_gram_cat(tm, word)
#> # A tibble: 13,909 x 3
#>         word     n cgramortho
#>        <chr> <int>      <chr>
#>  1         1     1       <NA>
#>  2      1789     1       <NA>
#>  3      1830     1       <NA>
#>  4      1848     1       <NA>
#>  5      1870     4       <NA>
#>  6   abaissé     1    VER,ADJ
#>  7   abaissé     1    VER,ADJ
#>  8 abaissées     1    VER,ADJ
#>  9 abaissées     1    VER,ADJ
#> 10   abandon     1        NOM
#> # ... with 13,899 more rows
```

### `is_lemme`

Test if a word is a lemme :

``` r
is_lemme(tm, word)
#> # A tibble: 13,909 x 3
#>         word     n islem
#>        <chr> <int> <lgl>
#>  1         1     1    NA
#>  2      1789     1    NA
#>  3      1830     1    NA
#>  4      1848     1    NA
#>  5      1870     4    NA
#>  6   abaissé     1 FALSE
#>  7   abaissé     1  TRUE
#>  8 abaissées     1 FALSE
#>  9 abaissées     1 FALSE
#> 10   abandon     1  TRUE
#> # ... with 13,899 more rows
```

### `count_*` wrappers

Several counting functions are available:

``` r
count_syll(tm, word)
#> # A tibble: 13,909 x 3
#>         word     n nbsyll
#>        <chr> <int>  <int>
#>  1         1     1     NA
#>  2      1789     1     NA
#>  3      1830     1     NA
#>  4      1848     1     NA
#>  5      1870     4     NA
#>  6   abaissé     1      3
#>  7   abaissé     1      3
#>  8 abaissées     1      3
#>  9 abaissées     1      3
#> 10   abandon     1      3
#> # ... with 13,899 more rows
```

Install
-------

``` r
devtools::install_github("ColinFay/lexiquer")
```

Feedbacks
---------

Questions and feedbacks [welcome](mailto:contact@colinfay.me)!

You want to contribute ? Open a [PR](https://github.com/ColinFay/lexiquer/pulls) :) If you encounter a bug or want to suggest an enhancement, please [open an issue](https://github.com/ColinFay/lexiquer/issues).
