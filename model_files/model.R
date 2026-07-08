library(ggplot2)
library(corrplot)
library(MASS)


df <- read.csv("blr_mort_weather.csv")

#split data based on enso phase
df$enso_phase <- cut(
  df$oni,
  breaks=c(-Inf,-0.5,0.5,Inf),
  labels=c("La Nina","Neutral","El Nino")
)

#box plot to compare differences in mortality
boxplot(tot_deaths_per_10k ~ enso_phase, data=df)


#deaths pred by phase
summary(aov(tot_deaths_per_10k ~ enso_phase, data=df))


#El Nino and La Nina are compared to Neutral 
df$enso_phase <- relevel(
  factor(df$enso_phase),
  ref = "Neutral"
)

#Multi regression model
tot <- lm(tot_deaths_per_10k ~ avg_max_temp + total_rain + factor(month) + factor(enso_phase), data = df)

summary(tot)

#Choosing pred variables using stepwise AIC
step_aic <- stepAIC(tot, direction = "backward", trace = 0)
formula(step_aic)

