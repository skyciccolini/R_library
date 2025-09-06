# create df for labels
PP_lab <- palmerpenguins::penguins |>
  drop_na() |> 
  group_by(species) |> 
  summarize(mean_x = mean(body_mass_g),
            mean_y = mean(bill_length_mm),
            .groups = "drop")

# use new df in geom_label
ggplot() +
  geom_point(data = palmerpenguins::penguins |> drop_na(),
             aes(x = body_mass_g, y = bill_length_mm, color = species)) +
  geom_label(data = PP_lab,
             aes(x = mean_x, y = mean_y, label = species, color = species),
             size = 7) +
  scale_color_paletteer_d(`"feathers::cassowary"`, guide = NULL)