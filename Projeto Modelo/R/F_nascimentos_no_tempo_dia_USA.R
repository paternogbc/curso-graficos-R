### Projeto: Frequência de nascimentos nos USA
### Author: Gustavo B Paterno
### paternogbc@gmail.com
### criado: 2018-12-06
### atualizado: 2018-12-06
### Script: Figura 1, 2, 3 e 4
###-----------------------------------------------

### Start----
# Pacotes
rm(list = ls()) # remove todos os objetos
library(tidyverse)
library(ggpubr)
library(gganimate)

# carregar tema padronizado e funções próprias
source("R/F_tema_graficos.R")
source("R/utils.R")

# avaliar e renomear----
# Carregar o banco de dados
dall <- read.csv("data-clean/tabela_nascimentos_all.csv", 
                 stringsAsFactors = T)
dano <- read.csv("data-clean/tabela_nascimentos_ano.csv")
dmes <- read.csv("data-clean/tabela_nascimentos_mes.csv")

# transformar variáveis em texto (para evitar confundir com número)
dall <- 
  mutate(dall,
         mes = as.character(mes),
         dia = as.character(dia)) 
glimpse(dall)
glimpse(dano)

# Figura 1----
# Média de nascimentos ao longo do tempo
g1 <- 
  ggplot(dano, aes(y = media, x = ano)) +
  geom_ribbon(aes(ymin = media - se, 
                  ymax = media + se),
              fill = "purple", alpha = .2) +
  geom_point(color = gray(.2)) +
  geom_line(color = gray(.3)) + 
  scale_x_continuous(limits = c(2000,2014), 
                     breaks = seq(2000, 2014, 2)) +
  scale_y_continuous(limits = c(10700, 12200), 
                     breaks = seq(10800, 12200, 200),
                     labels = paste(seq(10800, 12200, 200)/1000, "mil")) +
  geom_vline(xintercept = 2007, lty = "dashed",
             color = "purple", alpha = .5) +
  labs(x = "Ano", y = "Número de nascimentos / dia") +
  tema_guga();g1
  
# Figura 2------
# Nascimento vs dia do mês
# Média de nascimentos ao longo do tempo
g2 <- 
  ggplot(dmes, aes(y = media, x = mes)) +
  geom_ribbon(aes(ymin = media - se, 
                  ymax = media + se),
              fill = "purple", alpha = .2) +
  geom_point(color = gray(.2)) +
  geom_line(color = gray(.3)) + 
  scale_x_continuous(limits = c(1, 12), 
                     breaks = seq(1, 12, 1),
                     labels = c("Jan.", "Fev.","Mar",
                                "Abr.","Mai.", "Jun.", "Jul.",
                                "Ago.", "Set.","Out.", "Nov",
                                "Dez.")) +
  scale_y_continuous(limits = c(10700, 12200), 
                     breaks = seq(10800, 12200, 200),
                     labels = paste(seq(10800, 12200, 200)/1000, "mil")) +
  geom_vline(xintercept = 9, lty = "dashed",
             color = "purple", alpha = .5) +
  labs(x = "Mês", y = "Número de nascimentos / dia") +
  tema_guga();g2

# Figura 3------
# Nascimento vs dia da semana
### The distribution of births is equal between weekdays?
g3 <- 
  ggplot(dall, aes(y = n, x = dia, fill = dia)) +
  geom_violin(show.legend = F, color = NA, alpha = .5) +
  geom_boxplot(width = .1, outlier.colour = NA, fill = "white",
               show.legend = F) +
  scale_y_continuous(limits = c(6000,16000),
                     breaks = seq(6000, 16000, 2000),
                     labels = paste(seq(6000, 16000, 2000)/1000, "mil")) +
  scale_fill_manual(values = c(rep(gray(.75), times = 5), "purple",  "purple")) +
  scale_x_discrete(labels = c("	Seg.", "Ter.","Qua",
                              "Qui.","Sex.", "Sab.", "Dom.")) +
  labs(title = "Americanos nascem menos no fim de semana",
       subtitle = "",
       x = "Dia da semana", y = "Número de nascimentos / dia",
       caption = "") +
  tema_guga();g3

# Figura 4------
# Distribuição do número de nascimentos por dia
g4 <-
  ggplot(dall, aes(x = n)) +
  geom_histogram(fill = "purple", alpha = .2, binwidth = 200, color = "purple") +
  geom_density(aes(y = 200 * ..count..), color = "purple") +
  scale_x_continuous(limits = c(5000,16000),
                   breaks = seq(5000, 16000, 2000),
                   labels = paste(seq(5000, 16000, 2000)/1000, "mil")) +
  geom_vline(xintercept = c(7900, 12650), 
             lty = "dashed", color = "purple") +
  labs(title = "Distribuição bimodal de nascimentos por dia",
       x = "Número de nascimentos / dia", y = "Frequência") +
  tema_guga();g4


### Ex. Juntar pranchas-----
gall <- 
  ggarrange(g1, g2, g3, g4, 
            labels = c("A", "B", "C", "D"), widths = c(1,1,1,1))
gall
### Salvar Figuras----
# g1----
ggsave(g1, filename = "figures/figura_1_ano.png", device = "png", 
       width = 8.3, height = 5)
# g2----
ggsave(g2, filename = "figures/figura_2_mes.png", device = "png", 
       width = 8.3, height = 5)
# g3----
ggsave(g3, filename = "figures/figura_3_semana.png", device = "png", 
       width = 8.3, height = 5)
# g4----
ggsave(g4, filename = "figures/figura_4_histograma.png", device = "png", 
       width = 8.3, height = 5)
# Prancha----
ggsave(gall, filename = "figures/figura_completa.png", device = "png", 
       width = 12, height = 7.2)

### Extra:
### Animação Figura 1----
options(gganimate.dev_args = list(width = 800, height = 600))
#g1a <- g1 + gganimate::transition_reveal(id = 1, along = ano)
#animate(g1a, nframes = 100)  
#anim_save(filename = "figures/anim_nascimento_ano.gif")
### END----