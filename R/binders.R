#' Binders functions
#'
#' @param df the dataframe
#' @param col the column with words
#'
#' @import rlang
#' @importFrom dplyr select rename
#'
#' @return a tibble
#' @export
#'
#' @rdname binders
#'
#' @examples
#' ad <- proustr::albertinedisparue
#' baka <- tidytext::unnest_tokens(ad, mots, text) %>%
#'     count(mots)
#' bind_homograph(baka, mots)
#' bind_gram_cat(baka, mots)

bind_homograph <- function(df, col){
  data(list = "lexique", package = "lexiquer", envir = environment())
  col <- enexpr(col)
  lex <- lexique %>%
    select(ortho, nbhomogr) %>%
    rename(!! col := ortho)
  left_join(df, lex)
}

#' @rdname binders
#' @export

bind_homophon <- function(df, col){
  data(list = "lexique", package = "lexiquer", envir = environment())
  col <- quo_name(enquo(col))
  lex <- lexique %>%
    select(ortho, nbhomoph) %>%
    rename(!! col := ortho)
  left_join(df, lex)
}

#' @rdname binders
#' @export

bind_phonem <- function(df, col){
  data(list = "lexique", package = "lexiquer", envir = environment())
  col <- enexpr(col)
  lex <- lexique %>%
    select(ortho, nbphons) %>%
    rename(!! col := ortho)
  left_join(df, lex)
}

#' @rdname binders
#' @export

bind_morphem <- function(df, col){
  data(list = "lexique", package = "lexiquer", envir = environment())
  col <- enexpr(col)
  lex <- lexique %>%
    select(ortho, nbmorph) %>%
    rename(!! col := ortho)
  left_join(df, lex)
}

#' @rdname binders
#' @export

bind_gram_cat <- function(df, col){
  data(list = "lexique", package = "lexiquer", envir = environment())
  col <- enexpr(col)
  lex <- lexique %>%
    select(ortho, cgramortho) %>%
    rename(!! col := ortho)
  left_join(df, lex)
}

#' @rdname binders
#' @export

bind_gender <- function(df, col){
  data(list = "lexique", package = "lexiquer", envir = environment())
  col <- enexpr(col)
  lex <- lexique %>%
    select(ortho, genre) %>%
    rename(!! col := ortho)
  left_join(df, lex)
}

#' @rdname binders
#' @export

bind_infover <- function(df, col){
  data(list = "lexique", package = "lexiquer", envir = environment())
  col <- enexpr(col)
  lex <- lexique %>%
    select(ortho, infover) %>%
    rename(!! col := ortho)
  left_join(df, lex)
}

#' @rdname binders
#' @export

bind_infover <- function(df, col){
  data(list = "lexique", package = "lexiquer", envir = environment())
  col <- enexpr(col)
  lex <- lexique %>%
    select(ortho, infover) %>%
    rename(!! col := ortho)
  left_join(df, lex)
}
