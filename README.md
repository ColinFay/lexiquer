<!-- README.md is generated from README.Rmd. Please edit that file -->
Notes: this package is still under development.

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
ds <- ducotedechezswann

tm <- unnest_tokens(ds, word, text) %>%
  slice(1:10) %>%
  select(word)
tm %>%
  left_join(lexique, by = c("word" = "ortho")) %>%
  select(lemme, cgramortho) %>%
  na.omit() %>%
  count(lemme, cgramortho) %>%
  top_n(10, n) %>%
  arrange(desc(n))
#> # A tibble: 13 x 3
#>        lemme  cgramortho     n
#>        <chr>       <chr> <int>
#>  1    couché VER,ADJ,NOM     2
#>  2        de ART:def,PRE     2
#>  3      être     VER,AUX     2
#>  4        je NOM,PRO:per     2
#>  5        me NOM,PRO:per     2
#>  6         à         PRE     1
#>  7       bon     ADJ,NOM     1
#>  8     bonne     ADJ,NOM     1
#>  9   coucher VER,ADJ,NOM     1
#> 10     heure         NOM     1
#> 11 longtemps         ADV     1
#> 12   parfois         ADV     1
#> 13    suivre     VER,AUX     1
```

### `bind_*` wrappers

`{lexiquer}` provides a series of wrapper to bind specific part of the corpus to your text. See the `bind_*` functions for more details.

For example, you can binf the grammatical category of the word:

``` r
bind_gram_cat(tm, word)
#> # A tibble: 18 x 2
#>         word  cgramortho
#>        <chr>       <chr>
#>  1 longtemps         ADV
#>  2        je NOM,PRO:per
#>  3        je NOM,PRO:per
#>  4        me NOM,PRO:per
#>  5        me NOM,PRO:per
#>  6      suis     VER,AUX
#>  7      suis     VER,AUX
#>  8      suis     VER,AUX
#>  9    couché VER,ADJ,NOM
#> 10    couché VER,ADJ,NOM
#> 11    couché VER,ADJ,NOM
#> 12        de ART:def,PRE
#> 13        de ART:def,PRE
#> 14     bonne     ADJ,NOM
#> 15     bonne     ADJ,NOM
#> 16     heure         NOM
#> 17   parfois         ADV
#> 18         à         PRE
```

Or the lemme

``` r
bind_lemme(tm, word)
#> # A tibble: 13 x 2
#>         word     lemme
#>        <chr>     <chr>
#>  1 longtemps longtemps
#>  2        je        je
#>  3        me        me
#>  4      suis    suivre
#>  5      suis      être
#>  6    couché   coucher
#>  7    couché    couché
#>  8        de        de
#>  9     bonne       bon
#> 10     bonne     bonne
#> 11     heure     heure
#> 12   parfois   parfois
#> 13         à         à
```

### `is_lemme`

Test if a word is a lemme :

``` r
is_lemme(tm, word)
#> # A tibble: 18 x 2
#>         word islem
#>        <chr> <lgl>
#>  1 longtemps  TRUE
#>  2        je  TRUE
#>  3        je  TRUE
#>  4        me  TRUE
#>  5        me  TRUE
#>  6      suis FALSE
#>  7      suis FALSE
#>  8      suis FALSE
#>  9    couché FALSE
#> 10    couché  TRUE
#> 11    couché  TRUE
#> 12        de  TRUE
#> 13        de  TRUE
#> 14     bonne FALSE
#> 15     bonne  TRUE
#> 16     heure  TRUE
#> 17   parfois  TRUE
#> 18         à  TRUE
```

### `count_*` wrappers

Several counting functions are available:

``` r
count_syll(tm, word)
#> # A tibble: 18 x 2
#>         word nbsyll
#>        <chr>  <int>
#>  1 longtemps      2
#>  2        je      1
#>  3        je      1
#>  4        me      1
#>  5        me      1
#>  6      suis      1
#>  7      suis      1
#>  8      suis      1
#>  9    couché      2
#> 10    couché      2
#> 11    couché      2
#> 12        de      1
#> 13        de      1
#> 14     bonne      1
#> 15     bonne      1
#> 16     heure      1
#> 17   parfois      2
#> 18         à      1
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
