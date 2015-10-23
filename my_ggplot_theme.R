#my favorite theme for ggplot2
library(ggplot2)
library(reshape2)
library(dplyr)

size_mod <- -4
cool_theme <- theme(plot.background=element_rect(fill = "transparent",
                                                 colour = "transparent"),
                    panel.grid.major = element_line(colour="lightgrey", linetype = "dashed"),
                    panel.background = element_rect(fill = "white",colour = "black"),
                    legend.background = element_rect(fill="NA"),
                    legend.position = "right",
                    axis.text = element_text(size=12 + size_mod),
                    axis.title.x = element_text(size=16 + size_mod, vjust = -1), 
                    axis.title.y = element_text(size=16 + size_mod, vjust = 1),
                    strip.text = element_text(size=12 + size_mod, face = "bold"),
                    strip.background = element_rect(fill="grey", colour = "black"),
                    legend.text = element_text(size=13 + size_mod), 
                    legend.title = element_text(size=17 + size_mod),
                    plot.title = element_text(size=20 + size_mod))
