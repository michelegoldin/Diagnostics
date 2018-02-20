library(tidyverse)
library(ggfortify)

my_cars_data <- read_csv("./data/my_data.csv")

glimpse(my_cars_data)
summary(my_cars_data)
head(my_cars_data)

mod1 <- lm(mpg~wt, data =mtcars)
summary(mod1)


#1 The regression model is linear in parameters
#eyeball it
mtcars %>%
ggplot(., aes(x=wt, y =mpg))+
  geom_point() +
  geom_smooth()

#2. Check that the mean of residuals equals zero
#check model summary and test manually

summary(mod1)
mean(mod1$residuals)

#3 Homoskedasticity of residuals or equal variance
#left side plots

autoplot(mod1, which = c(1,3))

#4 No autocorrelation of residuals

acf(mod1$residuals) # visual inspection
lmtest::dwtest(mod1) #formal test: Durbin-Watson test

#5 Noramlity of residuals

autoplot(mod1)


my_df <- mtcars

write_csv(x=my_df, path = "./data/my_data.csv")

#for help go into console and type in args(write_csv) or ?(write_csv)


