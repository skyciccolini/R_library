# lets try to make a secondary axis

# create a scaling factor in each dfs
scale_factor <- max(TP_Fran_max_temp_summer_preds$predicted_prob, na.rm = TRUE) / ## TP has bigger predicted probs
  max(PF_Fran_max_temp_summer_preds$predicted_prob, na.rm = TRUE) ## PF has smaller predicted probs

# create rescaled version of PF
PF_rescaled <- PF_Fran_max_temp_summer_preds
PF_rescaled$predicted_prob_scaled <- PF_rescaled$predicted_prob * scale_factor
PF_rescaled$ci_lower_scaled <- PF_rescaled$ci_lower * scale_factor
PF_rescaled$ci_upper_scaled <- PF_rescaled$ci_upper * scale_factor

# plot again with secondary axis
ggplot() +
  geom_line(data = TP_Fran_max_temp_summer_preds,
            aes(x = max_temp_summer, y = predicted_prob, linetype = Site)) +
  geom_ribbon(data = TP_Fran_max_temp_summer_preds,
              aes(x = max_temp_summer, y = predicted_prob,
                  ymin = ci_lower, ymax = ci_upper, linetype = Site),
              alpha = 0.2) +
  geom_line(data = PF_rescaled,
            aes(x = max_temp_summer, y = predicted_prob_scaled, linetype = Site)) +
  geom_ribbon(data = PF_rescaled,
              aes(x = max_temp_summer, y = predicted_prob_scaled,
                  ymin = ci_lower_scaled, ymax = ci_upper_scaled, linetype = Site),
              alpha = 0.2) +
  scale_y_continuous(
    name = "Predicted Probability (Remnant)", ## name of primary y
    sec.axis = sec_axis(~ . / scale_factor, name = "Predicted Probability (Reconstructed)") ## name of secondary y
  ) +
  labs(x = expression("Nymphal Questing Max Summer Temperature (" * ~degree * C * ")")) +
  manuscript_theme
