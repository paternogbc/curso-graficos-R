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
d <- read.csv("data-clean/tabela_nascimentos_all.csv")

## ANOVA nascimento ~ dia da semana----
# AJustar modelo
m <- lm(n ~ dia, d) 
summary(m)

# Tabela de anova
tab_anova <- anova(m)
tab_anova