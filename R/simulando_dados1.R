### Simulando dados curso UFJF (gráficos básicos)
set.seed(123)
library(tidyverse)

# histograma
d1 <- data.frame(var1 = rnorm(n = 200, mean = 168, sd = 5))
<<<<<<< HEAD
write.csv(d1, "dados/histograma.csv")
=======
#write_csv(d1, "dados/histograma.csv")
>>>>>>> 71f2ef33e8fa9cccaf2f2df3c291835f3f46a4a7

# barras
d2 <- data.frame(
  var1 = rep(c("Grupo 1", "Grupo 2", "Grupo 3"), 
                     times = c(25, 30, 48))
)
<<<<<<< HEAD
write.csv(d2, "dados/barras.csv")
=======
#write_csv(d2, "dados/barras.csv")
>>>>>>> 71f2ef33e8fa9cccaf2f2df3c291835f3f46a4a7

# boxplot
d3 <- data.frame(
  var1 = rep(c("Grupo 1", "Grupo 2", "Grupo 3"), each = 30),
  var2 = c(rnorm(30, 25, 5),
           rnorm(30, 29, 5),
           rnorm(30, 35, 5)) 
)
<<<<<<< HEAD
write.csv(d3, "dados/boxplot.csv")
=======
#write_csv(d3, "dados/boxplot.csv")
>>>>>>> 71f2ef33e8fa9cccaf2f2df3c291835f3f46a4a7

# dispersão
x <- rnorm(30, 50)
y <- x + rnorm(30, 10, .5)
d4 <- data.frame(
  var1 = x, var2 = y
)
<<<<<<< HEAD
write.csv(d4, "dados/dispersão.csv")
=======
#write_csv(d4, "dados/dispersão.csv")
>>>>>>> 71f2ef33e8fa9cccaf2f2df3c291835f3f46a4a7

# linha
x <- 1990:2018
y <- x + rnorm(length(x), 3, 1)
d5 <- data.frame(
  var1 = x, var2 = y
)
<<<<<<< HEAD
write.csv(d5, "dados/linha.csv")
=======
#write_csv(d5, "dados/linha.csv")
>>>>>>> 71f2ef33e8fa9cccaf2f2df3c291835f3f46a4a7


