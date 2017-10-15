context("counter")

library(tidytext)
library(proustr)
library(tidyverse)

tm <- unnest_tokens(albertinedisparue, word, text) %>%
  count(word) %>%
  anti_join(proust_stopwords()) %>%
  top_n(10)

test_that("count_letters works", {
  a <- count_letters(tm, word)
  expect_equal(ncol(a), ncol(tm)+1)
  expect_equal(names(a), c("word", "n", "nblettres"))
  expect_true(inherits(a, "data.frame"))
})

test_that("count_homogr works", {
  a <- count_homogr(tm, word)
  expect_equal(ncol(a), ncol(tm)+1)
  expect_equal(names(a), c("word", "n", "nbhomogr"))
  expect_true(inherits(a, "data.frame"))
})

test_that("count_homoph works", {
  a <- count_homoph(tm, word)
  expect_equal(ncol(a), ncol(tm)+1)
  expect_equal(names(a), c("word", "n", "nbhomoph"))
  expect_true(inherits(a, "data.frame"))
})

test_that("count_phons works", {
  a <- count_phons(tm, word)
  expect_equal(ncol(a), ncol(tm)+1)
  expect_equal(names(a), c("word", "n", "nbphons"))
  expect_true(inherits(a, "data.frame"))
})

test_that("count_syll works", {
  a <- count_syll(tm, word)
  expect_equal(ncol(a), ncol(tm)+1)
  expect_equal(names(a), c("word", "n", "nbsyll"))
  expect_true(inherits(a, "data.frame"))
})

test_that("count_morph works", {
  a <- count_morph(tm, word)
  expect_equal(ncol(a), ncol(tm)+1)
  expect_equal(names(a), c("word", "n", "nbmorph"))
  expect_true(inherits(a, "data.frame"))
})
