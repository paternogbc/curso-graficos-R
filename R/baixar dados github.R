### Como fazer download dos dados diretamente do github
library(RCurl)

### Baixar um banco de dados
# Insira o endereço do arquivo (raw) 
# e <- "endereço do banco de dados"

### Exemplo baixando o banco de dados boxplot:
e <- getURL("https://raw.githubusercontent.com/paternogbc/curso-graficos-ufjf/master/dados/boxplot.csv")
d <- read.csv(text = e)

# Veja os dados
head(d)
