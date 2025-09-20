ggplot() +
  geom_rect(data = DayNight,
            aes(xmin = Lights_on, xmax = Lights_off,
                ymin = 0, ymax = Inf),
            fill = "gray80") +
  geom_path(data = WR, aes(x = Date, y = Revolutions, group = Wheel)) +
  facet_wrap("Wheel") +
  scale_x_datetime(date_labels = "%H:%M",
                   name = "Time") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
        strip.background = element_rect(fill = "goldenrod")) ## this changes the facet label background color


# remove the facet box and resize/bold the text labels
theme(strip.background = element_blank(),
      strip.text = element_text(face = "bold", size = rel(1.5)))























