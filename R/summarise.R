### pacotes
library(tidyverse)
library(dplyr)

### summarise
# Calcular a média do tamanho da pétala por espécie
summarise(group_by(iris, Species),
          med = mean(Petal.Length))


### d=bacno de dados gapminder
d <- read_csv("dados/gapminder.csv")

# média da expectativa de vida por país:
d2 <- summarise(group_by(d, year),
          m_vida = mean(lifeExp))
head(d2)

# VIsualizar dados processados:
ggplot(d2, aes(x = year, y = m_vida)) +
  geom_point() +
  geom_line(color = "tomato")

# Média da expectativa de vida por continente e por ano:
d3 <- summarise(group_by(d, continent, year),
                m_vida = mean(lifeExp))

# visualizar dados processados
ggplot(d3, aes(x = year, y = m_vida, 
               color = continent)) +
  geom_point() +
  geom_line()