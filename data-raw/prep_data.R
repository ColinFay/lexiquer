# prep data

library(readr)
corpus <- read_delim(file = "data-raw/Lexique381.txt", delim = "\t")
names(corpus) <- gsub('[0-9]*_', '', names(corpus))
devtools::use_data(corpus, overwrite = TRUE)
