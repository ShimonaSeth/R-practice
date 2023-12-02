# loading packages required to clean data
library(tidyverse)

#taking the glimpse() to view the column names and data types dataset
glimpse(Adverseevent)

#cleaning the dataset

#loading the csv file
data <- read.csv("Adverseevent.csv")
head(data)

#converting uppercase to lower case
data$County  <- tolower(data$County)
head(data)  

#saving the modified data
write.csv(data,"modified_adverseevent.csv")
head(data)