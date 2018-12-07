### Projeto: Frequência de nascimentos nos USA
### Author: Gustavo B Paterno
### paternogbc@gmail.com
### criado: 2018-12-06
### atualizado: 2018-12-06
### Script: Tratamento dos dados brutos
###-----------------------------------------------

### Start----
# Pacotes
rm(list = ls()) # remove todos os objetos
library(tidyverse)
# funções
source("R/utils.R")

# avaliar e renomear----
# Carregar o banco de dados
r <- read.csv("data-raw/dados_nascimento_usa_2000_2014.csv")

# avaliar variáveis
glimpse(r)

# remover variáveis não necessárias
r1 <- select(r, -date_of_month)
head(r1)

# renomear variáveis
r2 <-
  rename(r1, 
       ano = year,
       mes = month,
       dia = day_of_week,
       n   = births)
head(r2)

### Exportar dados----
# Tabela 1----
# 1. preparar tabela: média de nascimentos por ano
t1 <- summarise(group_by(r2, ano),
          media = mean(n),
          sd    = sd(n),
          se    = se(n),
          min   = min(n),
          max   = max(n))
## salvar tabela t1
write.csv(t1, file = "data-clean/tabela_nascimentos_ano.csv",
          row.names = F)
# testar leitura da tabela
t1 <- read.csv("data-clean/tabela_nascimentos_ano.csv")
glimpse(t1)

# Tabela 2----
# 1. preparar tabela: média de nascimentos por mes
t2 <- summarise(group_by(r2, mes),
                media = mean(n),
                sd    = sd(n),
                se    = se(n),
                min   = min(n),
                max   = max(n))
## salvar tabela t1
write.csv(t2, file = "data-clean/tabela_nascimentos_mes.csv",
          row.names = F)
# testar leitura da tabela
t2 <- read.csv("data-clean/tabela_nascimentos_mes.csv")
glimpse(t2)

# Tabela 3----
# 3. dados completos para analisar mudança no dia e no mes
## salvar tabela t1
write.csv(r2, file = "data-clean/tabela_nascimentos_all.csv",
          row.names = F)

# testar leitura da tabela
t3 <- read.csv("data-clean/tabela_nascimentos_all.csv")
glimpse(t3)

### END----