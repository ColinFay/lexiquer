#' Full lexique
#'
#' The full dataset of words from Lexique 3.81.
#'
#' @format A data frame
#' \describe{
#'   \item{ortho}{the word}
#'   \item{phon}{phonological form of the word}
#'   \item{lemme}{lemme of the word}
#'   \item{cgram}{grammatical category}
#'   \item{genre}{gender (if appliable)}
#'   \item{nombre}{number}
#'   \item{freqlemfilms2}{frequenecy of the stem in the film corpus(in thousands of unity)}
#'   \item{freqlemlivres}{frequenecy of the stem in the book corpus (in thousands of unity)}
#'   \item{freqfilms2}{frequenecy of the word in the film corpus(in thousands of unity)}
#'   \item{freqlivres}{frequenecy of the word in the book corpus(in thousands of unity)}
#'   \item{infover}{mode, tense and gender if verb}
#'   \item{nbhomogr}{number of homogram}
#'   \item{nbhomoph}{number of homophone}
#'   \item{islem}{wether of not this word is a lemme}
#'   \item{nblettres}{number of letters}
#'   \item{nbphons}{number of phonem}
#'   \item{cvcv}{orthographical structure}
#'   \item{pcvcv}{phonological structure}
#'   \item{voisorth}{number of orthographic neighbors}
#'   \item{voisphon}{number of phonologic neighbors}
#'   \item{puorth}{orthographic unicity point}
#'   \item{puphon}{phonetic unicity point}
#'   \item{syll}{phonological form}
#'   \item{nbsyll}{number of syllables}
#'   \item{cv-cv}{structure with syllables}
#'   \item{orthrenv}{letters reversal}
#'   \item{phonrenv}{phonetic reversal}
#'   \item{orthosyll}{orthographe wiht syllables}
#'   \item{cgramortho}{grammatical category}
#'   \item{deflem}{pourcentage of people knowing the def of the stem}
#'   \item{defobs}{number of people who answered with a definition for the stem}
#'   \item{old20}{Levenshtein orthographic distance}
#'   \item{pld20}{Levenshtein phonetic distance}
#'   \item{morphoder}{Derivational morphologie}
#'   \item{nbmorph}{Number of morphemes}
#' }
#' @source \url{http://www.lexique.org}

"lexique"
