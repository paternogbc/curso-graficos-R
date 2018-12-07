library(ggplot2)
tema_guga <- function(base_size = 18, base_family = "Decima WE"){
  theme_minimal(base_size = base_size, base_family = base_family) %+replace%
    theme(
      plot.title = element_text(size = 12),
      axis.title = element_text(size = 12),
      axis.text = element_text(size = 9),
      plot.subtitle = element_text(size = 9),
      plot.caption = element_text(size = 9, hjust = 1),
      #legend.key=element_rect(colour=NA, fill =NA),
      panel.grid = element_line(color = gray(.95)),   
      #panel.border = element_rect(fill = NA, colour = "black", size=1),
      #panel.background = element_rect(fill = "white", colour = "black"), 
      #strip.background = element_rect(fill = NA)
    )
}