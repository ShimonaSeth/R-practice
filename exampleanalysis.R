# loading packages required to clean data
library(tidyverse)
library(purrr)

#taking the glimpse() to view the column names and data types of a dataset
glimpse(data)
as_tibble(data)

#loading the csv file
data <- read.csv("Adverseevent.csv")

#return the data type of each column
print(sapply(data, class))

#cleaning the dataset
is.numeric(data$Population)

#converting character to numeric population
data$Population <- as.numeric(gsub(",", "", data$Population))
data$Population

# data$count' contains numbers as characters
data <- data %>%
  mutate(Count=as.numeric(Count))

#check assignment
data$Count <- as.numeric(data$Count)

data <- data %>% 
  mutate(count = safely(as.numeric)(count)$result)

# Check for NA values
na_values <- data$count[is.na(data$count)]


#check data set
str(data)

#deleting an extra column
data <- data %>%
  select(-count)

#converting uppercase to lowercase
data$County  <- tolower(data$County)
