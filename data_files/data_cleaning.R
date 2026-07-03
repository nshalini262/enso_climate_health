library(dplyr)
library(lubridate)

weather <- read.csv("weather.csv")

#standardize date format across rows
weather$Date <- dmy(gsub("/", "-", weather$Date))

#split data into month and year
weather <- weather %>%
  mutate(
    Year = year(Date),
    Month = month(Date)
  )

#change data types
weather <- weather %>%
  mutate(
    Rain = as.numeric(Rain),
    `Temp.Max` = as.numeric(`Temp.Max`)
  )

#calculations
weather_monthly <- weather %>%
  group_by(Year, Month) %>%
  summarise(
    avg_max_temp = mean(Temp.Max, na.rm = TRUE),
    total_rain = sum(Rain, na.rm = TRUE),
    .groups = "drop"
  )

write.csv(weather_monthly, "avg_weather.csv")

blr_data <- read.csv("blr_hist_mort.csv")



