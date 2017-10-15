#' Title
#'
#' @param df
#' @param col
#'
#' @return
#' @export
#'
#' @rdname counter
#'
#' @examples

count_letters <- function(df, col){
  data(list = "lexique", package = "lexiquer", envir = environment())
  col <- enexpr(col)
  lex <- lexique %>%
    select(ortho, nblettres) %>%
    rename(!! col := ortho)
  left_join(df, lex)
}


#' @rdname counter
#' @export

count_homogr <- function(df, col){
  data(list = "lexique", package = "lexiquer", envir = environment())
  col <- enexpr(col)
  lex <- lexique %>%
    select(ortho, nbhomogr) %>%
    rename(!! col := ortho)
  left_join(df, lex)
}

#' @rdname counter
#' @export

count_homoph <- function(df, col){
  data(list = "lexique", package = "lexiquer", envir = environment())
  col <- enexpr(col)
  lex <- lexique %>%
    select(ortho, nbhomoph) %>%
    rename(!! col := ortho)
  left_join(df, lex)
}

#' @rdname counter
#' @export

count_phons <- function(df, col){
  data(list = "lexique", package = "lexiquer", envir = environment())
  col <- enexpr(col)
  lex <- lexique %>%
    select(ortho, nbphons) %>%
    rename(!! col := ortho)
  left_join(df, lex)
}

#' @rdname counter
#' @export

count_syll <- function(df, col){
  data(list = "lexique", package = "lexiquer", envir = environment())
  col <- enexpr(col)
  lex <- lexique %>%
    select(ortho, nbsyll) %>%
    rename(!! col := ortho)
  left_join(df, lex)
}

#' @rdname counter
#' @export

count_morph <- function(df, col){
  data(list = "lexique", package = "lexiquer", envir = environment())
  col <- enexpr(col)
  lex <- lexique %>%
    select(ortho, nbmorph) %>%
    rename(!! col := ortho)
  left_join(df, lex)
}


