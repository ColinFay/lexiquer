# prep data

library(readr)
lexique <- read_delim(file = "data-raw/Lexique381.txt", delim = "\t")
names(lexique) <- gsub('[0-9]*_', '', names(lexique))
devtools::use_data(lexique, overwrite = TRUE)
