library("tidyverse")
library("ggplot")
theme_set(theme_light())

train <- read_csv("train.csv")

train$Survived <- as.factor(train$Survived)
train$Pclass <- as.factor(train$Pclass)

head(train)
#' EDA

train %>% 
  ggplot(aes(Age, Fare)) +
  geom_point() +
  facet_grid(. ~ Embarked)

train %>% 
  ggplot(aes(Embarked, Fare)) +
  geom_jitter(alpha = 0.2) +
  geom_violin()

#' 
train %>% 
  ggplot(aes(Survived, Fare)) +
  geom_jitter(alpha = 0.2) +
  facet_grid(. ~ Pclass)

train %>% 
  ggplot(aes(Survived, Age)) +
  geom_jitter(alpha = 0.2) +
  facet_grid(. ~ Pclass)

train %>% 
  ggplot(aes(Survived, Sex)) +
  geom_bin2d() +
  facet_grid(. ~ Pclass)

train$Survived %>% unique()

# identify missing ages
train %>% 
  filter(Age %in% NA)
