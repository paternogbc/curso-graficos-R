### Como fazer download dos dados diretamente do github
library(tidyverse)
library(RCurl)

### Baixar um banco de dados:
# url <- "endereço do banco de dados"

### Exemplo:
e <- "https://raw.githubusercontent.com/paternogbc/curso-graficos-ufjf/master/dados/barras.csv"
d <- read.csv(text = getURL(e))

# Veja os dados
head(d)
