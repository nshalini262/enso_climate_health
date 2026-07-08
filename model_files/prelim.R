library(ggplot2)


df <- read.csv("blr_mort_weather.csv")

#data exploration plots
#oni
ggplot(df, aes(x = id, y = oni)) +
  geom_line(color = "blue") +
  labs(
    title = "Oceanic Niño Index Over Time (2001 - 2023)",
    x = "Time (Months)",
    y = "ONI"
  ) +
  theme_minimal()

#rain
ggplot(df, aes(x = id, y = total_rain)) +
  geom_line(color = "blue") +
  labs(
    title = "Rainfall Over Time (2001 - 2023)",
    x = "Time (Months)",
    y = "Rainfall (mm)"
  ) +
  theme_minimal()

#temp
ggplot(df, aes(x = id, y = avg_max_temp)) +
  geom_line(color = "blue") +
  labs(
    title = "Temperature Over Time (2001 - 2023)",
    x = "Time (Months)",
    y = "Temperature (C)"
  ) +
  theme_minimal()







