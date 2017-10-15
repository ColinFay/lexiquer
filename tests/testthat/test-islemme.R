context("islemme")

library(tidytext)
library(proustr)
library(tidyverse)

tm <- unnest_tokens(albertinedisparue, word, text) %>%
  count(word) %>%
  anti_join(proust_stopwords()) %>%
  top_n(10)

test_that("is_lemme works", {
  a <- is_lemme(tm, word)
  expect_equal(ncol(a), ncol(tm)+1)
  expect_equal(names(a), c("word", "n", "islem"))
  expect_true(inherits(a, "data.frame"))
})
