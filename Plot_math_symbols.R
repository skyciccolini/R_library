# expression tells R to interpret this as symbols, not math fcns
ggplot(M, aes(x, y)) +
  geom_point() +
  labs(x = expression(Area~(sqrt(m^2))),
       y = expression(Species~density~(Species / m^2)))

# annotate and paste does the same thing
fm <- lm(y ~ x, data = M)
s <- summary(fm)

ggplot(M, aes(x, y)) +
  geom_point() +
  labs(x = expression(Area~(sqrt(m^2))),
       y = expression(Species~density~(Species / m^2))) +
  annotate(geom = "text",
           label = paste("italic(R) ^ 2 == ",
                         round(s$r.squared, 2)),
           parse = TRUE,
           x = 7.5, y = 10,
           size = 5)