# prep data

library(readr)
corpus <- read_delim(file = "data-raw/Lexique381.txt", delim = "\t")
use_data(corpus)
