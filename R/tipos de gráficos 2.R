# verifique se todos os pacotes estão instalados:
library(tidyverse)
library(gapminder)
library(ggridges)

# Tipos de gráficos em barra
# barra em pilha----
pais  <- rep(c("Brasil", "Argentina", "Bolívia"), each = 4)
grupo <- rep(LETTERS[1:4], times = 3) 
valor <- rnorm(12, 10, 5)
d <- data.frame(pais, grupo, valor)
head(d)

# barra em pilha
ggplot(d, aes(x = pais, y = valor, fill = grupo)) +
  geom_col() +
  scale_fill_viridis_d() +
  theme_minimal(base_size = 14)

# barra em pilha(%)----
pais  <- rep(c("Brasil", "Argentina", "Bolívia"), each = 4)
grupo <- rep(LETTERS[1:4], times = 3) 
valor <- (c(2,4,2,2, 
           5,1,1,3,
           7,1,1,1)/10)*100
d <- data.frame(pais, grupo, valor)
head(d)

# gráfico em pulha (%)
ggplot(d, aes(x = pais, y = valor, fill = grupo)) +
  geom_col() +
  scale_fill_viridis_d() +
  theme_minimal(base_size = 14)

# barras agrupadas (use o position = "dodge")
ggplot(d, aes(x = pais, y = valor, fill = grupo)) +
  geom_col(position = "dodge") +
  scale_fill_viridis_d() +
  theme_minimal(base_size = 14)

# 1. density----
# 1
ggplot(iris, aes(x = Petal.Length)) +
  geom_density(fill = "lightblue")

# 2
ggplot(iris, aes(x = Petal.Length, 
                 fill = Species)) +
    geom_density(alpha = .5)

# 2. violin-----
# 1
ggplot(iris, aes(y = Petal.Length, 
                 x = Species)) +
  geom_violin(fill = "lightblue")

# 2. violin + boxplot
ggplot(iris, aes(y = Petal.Length, 
                 x = Species)) +
  geom_violin(fill = "lightblue") +
  geom_boxplot(width = .2)

# 3. area----
# 1
d <- read.csv("dados/malaria.csv")
d1 <- filter(d, country == "Brazil")
ggplot(d1, aes(x = Year, y = deaths)) +
  geom_area(fill = "purple4")

# 2
ggplot(d, aes(x = Year, y = deaths,
              fill = country)) +
  geom_area()

# 4. bubble----
d <- filter(gapminder, year == 2007)
ggplot(d, aes(x = gdpPercap, y = lifeExp,
              size = pop,
              color = continent)) +
  geom_point(show.legend = F, alpha = .7) +
  scale_color_viridis_d() +
  theme_minimal(base_size = 20) 

# 5. Ridges 
# 1.
ggplot(iris, aes(x = Sepal.Length, y = Species,
                 fill = Species)) +
  geom_density_ridges(alpha = .7) +
  theme_minimal(base_size = 18)
    
# 6. Correlograma
data(mtcars)
corr <- round(cor(mtcars), 1)
corr

# Plot
library(ggcorrplot)

# Correlation matrix
data(mtcars)
corr <- round(cor(mtcars), 1)
ggcorrplot(corr, hc.order = TRUE, 
           type = "lower", 
           lab = TRUE, 
           lab_size = 3, 
           method="circle", 
           colors = c("tomato2", "white", "springgreen3"), 
           title="Correlogram of mtcars", 
           ggtheme = theme_bw)

# 7. Lolipop
# lollipop chart
d <- filter(gapminder, continent == "Americas" & year == 2007)

ggplot(d, aes(x = pop, y = reorder(country, pop))) +
  geom_segment(aes(x = 0, y = reorder(country, pop),
                   xend = pop,
                   yend = country), color = "grey50") +
  geom_point(size = 3) +
  theme_minimal(base_size = 18)

# Clever diagram
grupo1 <- rep(LETTERS[1:7], times = 2)
sexo   <- rep(c("M", "F"), each = 7)
valor  <- c(rnorm(7, 15, 5), rnorm(7, 15, 5))
d <- data.frame(grupo1, sexo, valor)
head(d)

### usando barras stacked
ggplot(d, aes(x = reorder(grupo1, valor), y = valor,
              fill = sexo)) +
  geom_col() +
  coord_flip()

### usando barras agrupadas
ggplot(d, aes(x = reorder(grupo1, valor), y = valor,
              fill = sexo)) +
  geom_col(position = "dodge") +
  coord_flip()

#1. 
ggplot(d, aes(x = reorder(grupo1, valor), y = valor,
              color = sexo,
              group = grupo1)) +
  geom_point(size = 5, alpha = .7) +
  geom_line(color = "black") +
  coord_flip() +
  theme_minimal(base_size = 14)
