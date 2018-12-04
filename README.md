# Disciplina: Gráficos Científicos no R 

Repositório com scripts, dados e exercícios da disciplina de Gráficos Científicos no R  

__Detalhes:__ `Pós-Graduação em Ecologia | UFJF | 3-7 de Dezembro de 2018`  
__Docente:__ `Gustavo Brant Paterno` (paternogbc@gmail.com)

> Aprenda como representar seus resultados em gráficos bonitos, corretos e no padrão para
publicação de revistas científicas

## Escopo 

A disciplina __Gráficos Científicos no R__ irá abordar de forma instrumental as noções básicas para a construção de gráficos de alta qualidade para publicação científica utilizando o software estatístico R, em especial o pacote ggplot2. No curso os discentes irão se aprofundar na teoria da representação gráfica e irão aprender como produzir gráficos que representem seus resultados e análises de forma correta, clara e elegante. Termine a disciplina sabendo como construir o gráfico perfeito para representar seus resultados e direcionar o leitor para a mensagem principal do seu trabalho.


## Pacotes necessários

Execute os comandos abaixo para instalar todos __pacotes de R__ necessários para acompanhar este curso.

``` r
### Pacotes necessários para o curso de Gráficos Científicos
### Instale os pacotes necessários
install.packages("tidyverse")
install.packages("ggpubr")
install.packages("RColorBrewer")
install.packages("devtools")
install.packages("RCurl")
install.packages("ggthemes")
### FIM-----
```

Você também pode encontrar o script para instalar os pacotes através do [link](https://github.com/paternogbc/curso-graficos-ufjf/blob/master/R/pacotes%20necessários.R)

# Banco de dados para exercícios

Ao longo do curso iremos utilizar diversos bancos de dados.

## 1. Dados Simulados para Exercícios

| N |  Categoria | Nome | link |
| :---: | :---: | :--- | :--- | 
| 1 | `Gráficos Básicos` | histograma | [dados](https://github.com/paternogbc/curso-graficos-ufjf/blob/master/dados/histograma.csv) | 
| 2 | `Gráficos Básicos` | barras | [dados](https://github.com/paternogbc/curso-graficos-ufjf/blob/master/dados/barras.csv) | 
| 3 | `Gráficos Básicos` | boxplot | [dados](https://github.com/paternogbc/curso-graficos-ufjf/blob/master/dados/boxplot.csv) | 
| 4 | `Gráficos Básicos` | dispersão | [dados](https://github.com/paternogbc/curso-graficos-ufjf/blob/master/dados/dispers%C3%A3o.csv) | 
| 5 | `Gráficos Básicos` | linha | [dados](https://github.com/paternogbc/curso-graficos-ufjf/blob/master/dados/linha.csv) |

## 2. Dados publicados

| N |  Categoria | Nome | descrição | link |
| :---: | :---: | :--- | :--- | :--- | 
| 1 | `Dados publicados` | vida | Expectativa de vida por país ao longo do tempo |  [dados](https://github.com/paternogbc/curso-graficos-ufjf/blob/master/dados/vida.csv) | 
| 2 | `Dados publicados` | wind | Capacidade de energia eólica instalada por país ao longo do tempo |  [dados](https://github.com/paternogbc/curso-graficos-ufjf/blob/master/dados/wind.csv) | 

> Novos bancos de dados serão adicionados ao longo da disciplina

*** 

# Links úteis

Alguns links importantes para aprofundamento ao longo da disciplina.

* [Manual do ggplot2](https://ggplot2.tidyverse.org)

* [TED Hans Rosling](https://www.ted.com/talks/hans_rosling_at_state#t-378798)

* [Gráficos enganosos](https://en.wikipedia.org/wiki/Misleading_graph)

> Novos links serão adicionados ao longo da disciplina.