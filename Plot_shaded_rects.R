# adds shaded gray rectangles for time between Lights off and Lights on (ie night)

ggplot() +
  geom_rect(data = DayNight,
            aes(xmin = Lights_off, xmax = Lights_on,
                ymin = 0, ymax = Inf),
            fill = "gray80") +
  geom_path(data = WR, aes(x = Date, y = Revolutions, group = Wheel)) +
  facet_wrap("Wheel")









































