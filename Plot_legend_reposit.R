# code for having only one legend center in second col in a two row, two col plot
combined_plot <- (P1 / P2) + 
  plot_layout(guides = "collect") +
  plot_annotation(tag_levels = "a", tag_suffix = ".") &
  theme(legend.position = "right",
        legend.justification = "center")