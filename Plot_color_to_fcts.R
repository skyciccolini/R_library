# write fcn to assign specific colors to levels of factor
tree_color_map <- function(){
  cmap <- ggplot2::scale_color_manual(
    name = "Species",
    values = c("Acer saccharinum" = "red",
               "Acer rubrum" = "orange",
               "Acer platanoides" = "blue",
               "Acer saccarum" = "purple"),
    guide = NULL)
  return(cmap)
}

# add in fcn element
Trunks |> 
  ggplot(aes(x = Species, y = DBH, color = Species)) +
  geom_violin() +
  geom_sina(seed = 74645) +
  tree_color_map() +
  theme(axis.text.x = element_text(face = "italic"))