### Simulando dados curso UFJF (gráficos básicos)
set.seed(123)
library(tidyverse)

# histograma
d1 <- data.frame(var1 = rnorm(n = 200, mean = 168, sd = 5))
write.csv(d1, "dados/histograma.csv")

# barras
d2 <- data.frame(
  var1 = rep(c("Grupo 1", "Grupo 2", "Grupo 3"), 
                     times = c(25, 30, 48))
)
write.csv(d2, "dados/barras.csv")

# boxplot
d3 <- data.frame(
  var1 = rep(c("Grupo 1", "Grupo 2", "Grupo 3"), each = 30),
  var2 = c(rnorm(30, 25, 5),
           rnorm(30, 29, 5),
           rnorm(30, 35, 5)) 
)
write.csv(d3, "dados/boxplot.csv")

# dispersão
x <- rnorm(30, 50)
y <- x + rnorm(30, 10, .5)
d4 <- data.frame(
  var1 = x, var2 = y
)
write.csv(d4, "dados/dispersão.csv")

# linha
x <- 1990:2018
y <- x + rnorm(length(x), 3, 1)
d5 <- data.frame(
  var1 = x, var2 = y
)
write.csv(d5, "dados/linha.csv")