#' Counters
#'
#' \describe{
#'   \item{count_letters}{counts the number of letters in a word}
#'   \item{count_homogr}{counts the number of homograms of a word}
#'   \item{count_homoph}{counts the number of homographs of a word}
#'   \item{count_phons}{counts the number of phonems in a word}
#'   \item{count_syll}{counts the number of syllables in a word}
#'   \item{count_morph}{counts the number of morphems in a word}
#'}
#'
#' @param df the dataframe
#' @param col the column with words
#'
#' @return a data.frame with words and a column with the specific count of element
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


