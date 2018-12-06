### Pacotes
library(ggplot2)
library(dplyr)

### Simulando dados:
set.seed(1235)
nutrientes <- rep(c("+NP", "-NP"), each = 5)
biomassa   <- round(c(rnorm(5,13,2), rnorm(5, 8, 2)), digits = 1)
d1 <- data.frame(nutrientes, biomassa)
glimpse(d1)
head(d1)

### Calculando média e desvio por tratamento 
d2 <- summarise(group_by(d1, nutrientes),
                media  = mean(biomassa),
                desvio = sd(biomassa))

### Gráficos de barras com a média
ggplot(d2, aes(y = media, x = nutrientes, fill = nutrientes)) +
  geom_col()

### Gráficos de barras com a média e barra de erro:
ggplot(d2, aes(y = media, x = nutrientes, fill = nutrientes)) +
  geom_col() +
  geom_errorbar(aes(ymin = media - desvio,
                    ymax = media + desvio))      

# Utilize o argumento "width" para diminuir a largura da barra de erro
ggplot(d2, aes(y = media, x = nutrientes, fill = nutrientes)) +
  geom_col() +
  geom_errorbar(aes(ymin = media - desvio,
                    ymax = media + desvio),
                width = 0.2)      