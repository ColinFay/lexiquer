context("bind")

library(tidytext)
library(proustr)
library(tidyverse)

tm <- unnest_tokens(albertinedisparue, word, text) %>%
  count(word) %>%
  anti_join(proust_stopwords()) %>%
  top_n(10)

test_that("bind_gram_cat works", {
  a <- bind_homograph(tm, word)
  expect_equal(ncol(a), ncol(tm)+1)
  expect_equal(names(a), c("word", "n", "nbhomogr"))
  expect_true(inherits(a, "data.frame"))
})

test_that("bind_homophon works", {
  a <- bind_homophon(tm, word)
  expect_equal(ncol(a), ncol(tm)+1)
  expect_equal(names(a), c("word", "n", "nbhomoph"))
  expect_true(inherits(a, "data.frame"))
})

test_that("bind_phonem works", {
  a <- bind_phonem(tm, word)
  expect_equal(ncol(a), ncol(tm)+1)
  expect_equal(names(a), c("word", "n", "nbphons"))
  expect_true(inherits(a, "data.frame"))
})

test_that("bind_gram_cat works", {
  a <- bind_gram_cat(tm, word)
  expect_equal(ncol(a), ncol(tm)+1)
  expect_equal(names(a), c("word", "n", "cgramortho"))
  expect_true(inherits(a, "data.frame"))
})

test_that("bind_gender works", {
  a <- bind_gender(tm, word)
  expect_equal(ncol(a), ncol(tm)+1)
  expect_equal(names(a), c("word", "n", "genre"))
  expect_true(inherits(a, "data.frame"))
})

test_that("bind_infover works", {
  a <- bind_infover(tm, word)
  expect_equal(ncol(a), ncol(tm)+1)
  expect_equal(names(a), c("word", "n", "infover"))
  expect_true(inherits(a, "data.frame"))
})

test_that("bind_infover works", {
  a <- bind_infover(tm, word)
  expect_equal(ncol(a), ncol(tm)+1)
  expect_equal(names(a), c("word", "n", "infover"))
  expect_true(inherits(a, "data.frame"))
})

