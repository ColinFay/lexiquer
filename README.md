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

df <- unnest_tokens(ad, word, text) %>%
  count(word) %>%
  anti_join(sw) %>%
  left_join(lexique, by = c("word" = "ortho")) %>%
  select(lemme, cgramortho) %>%
  na.omit() %>%
  count(lemme, cgramortho) %>%
  top_n(10, n) %>%
  arrange(desc(n))
#> Warning: Column `word` joining character vector and factor, coercing into
#> character vector
```

`{lexiquer}` provides a series of wrapper to bind specific part of the corpus to your text. See the `bind_*` functions for more details.

``` r
bind_gram_cat(df, word)
#> Joining, by = "cgramortho"
#> # A tibble: 669,024 x 4
#>    lemme cgramortho     n          word
#>    <chr>      <chr> <int>         <chr>
#>  1 faire        VER    23       abaissa
#>  2 faire        VER    23      abaissai
#>  3 faire        VER    23   abaissaient
#>  4 faire        VER    23     abaissait
#>  5 faire        VER    23     abaissent
#>  6 faire        VER    23      abaisser
#>  7 faire        VER    23     abaissera
#>  8 faire        VER    23    abaisserai
#>  9 faire        VER    23 abaisseraient
#> 10 faire        VER    23   abaisserais
#> # ... with 669,014 more rows
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
