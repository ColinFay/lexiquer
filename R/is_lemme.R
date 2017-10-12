#' Is the word a lemme?
#'
#' @param df a data frame
#' @param col the column with words
#'
#' @return a tibble
#' @export
#'
#' @examples
#' a <- data.frame(words = c("mer", "poulet", "lapin"))
#' is_lemme(a, words)

is_lemme <- function(df, col){
  data(list = "lexique", package = "lexiquer", envir = environment())
  col <- enexpr(col)
  lex <- lexique %>%
    mutate(islem = as.logical(islem)) %>%
    select(ortho, islem) %>%
    rename(!! col := ortho)
  left_join(df, lex)
}
