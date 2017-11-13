#' Binders functions
#'
#' \describe{
#'   \item{bind_gram_cat}{bind the grammatical category of a word}
#'   \item{bind_gender}{bind the gender of a word (if appliable)}
#'   \item{bind_infover}{bind the verbal info of a verb (if appliable)}
#'   \item{bind_infover}{bind the lemme to a word}
#'}
#'
#' @param df the dataframe
#' @param col the column with words
#'
#' @import rlang
#' @importFrom dplyr select rename
#' @importFrom utils data
#'
#' @return a tibble
#' @export
#'
#' @rdname binders
#'
#' @examples
#' ad <- proustr::albertinedisparue
#' b <- tidytext::unnest_tokens(ad, mots, text) %>%
#'     count(mots) %>%
#'     slice(1:10)
#' bind_homograph(b, mots)
#' bind_gram_cat(b, mots)


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

bind_lemme <- function(df, col){
  data(list = "lexique", package = "lexiquer", envir = environment())
  col <- enexpr(col)
  lex <- lexique %>%
    select(ortho, lemme) %>%
    rename(!! col := ortho)
  left_join(df, lex) %>%
    unique()
}


