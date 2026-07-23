# --- Basic concepts to know from the start ----

print("Hello")


# --- RStudio is case sensitive ----
# Assignment: Use <- to assign values (assignment operator)
x <- 10
y = 3
a <- c(10,2)
c <- 3
d <- 4

# you can do this as well in the console

# Remove the vector or data frame from Global environment
rm(x)
rm(a, c, d)  # we can do this in the console

# Click on the broom icon in your global environment to delete all the variables

# Let's create larger vectors:
ages <- c(25, 35, 24, 25, 34, 33, 34, 26, 27, 20, 20, 23, 22, 28)

# Built in functions for descriptive statistics:
length(ages)
mean(ages)
median(ages)
max(ages)
min(ages)

mean_ages <- mean(ages)

mean_ages

sort(ages)
# to give us the signature of the function
?sort

sort(ages, decreasing = TRUE)
# To give the descriptive analysis
summary(ages)

table(ages)  # Frequency table

table (ages > 21)


# To get more information omn the function itself
?mean

# Install and load Packages: Collections of R functions and data sets
install.packages("tidyverse")  # once
library(tidyverse)
?tidyverse

# --- CALCULATIONS WITH R ----


Name <- c("Alice", "Brian", "Carlos", "Diana", "Emily")
Age <- c(25, 35, 24, 25, 34)
Score <- c(85, 90, 88, 92, 88)
work_type <- c("Part time", "Part time", "Full time", "Part time", "Full time")

table(Name)
table(Age)

student_table <- table(Name)
student_table <- table(Age)
student_table


# To know teh type of the data
typeof(Name)


# Before we create a data frame we need to check the variable length

length(Name) == length(Age) &&
  length(Name) == length(Score) &&
  length(Name) == length(work_type) &&
  
# Create a data frame with these variables
data.frame(Name, Age, Score, work_type)
?data.frame

student_data <- data.frame(Name, Age, Score, work_type)
student_data

getwd()

# Now to save a data frame to your computer
write.csv(student_data, file="student_data.csv", row.names = T)
?write.csv


# to read a data set use "read.csv" function or use "Import"

read.csv("enamp_sample_telemetry_10k.csv")
df_1 <- read.csv("enamp_sample_telemetry_10k.csv")

df_2 <- read.csv('C:/Users/piuze/OneDrive/Escritorio/University of Niagara Falls/Career Services/Enamp/enamp_sample_telemetry_10k.csv')

file_path <- 'C:/Users/piuze/OneDrive/Escritorio/University of Niagara Falls/Career Services/Enamp/enamp_sample_telemetry_10k.csv'

df_3 <- read.csv(file_path)


# IMPORTANT: In R, you must replace all \ backslashes with / forward

# to display a dataset

head(df_3, 5)

# to explore the data set strcuture

str(df_3)
dim(df_3)
colnames(df_3)
summary(df_3)

# Descriptive statistics ----
attach(df_3)
sd(voltage)
mean(df_3$voltage)
var(df_3$voltage)
sapply(df_3, sd) # Stahdar deviation from the mean for all variables

# Installing and loading packages ----

library(tidyverse)

library(dplyr)
# filter() select rows that meet certain conditions

data <- mtcars
head(data)

head(data, 8)

# %<% the pipe operator

data_4 <- mtcars %>%
  filter(cyl == 4)

data_4

# Select() choose columns to keep
mtcars %>%
  select(mpg, hp, wt)          # Keep only the selected columns


# mutate() create new variables 
# Create a new column for kpl
new.data <- mtcars |> 
  mutate(kpl = mpg * 0.45144)

head(new.data)

# relocate a new column
data_new <- new.data |> 
  relocate(kpl, .after = mpg)

data_new

data |> 
  arrange(hp)

# group_by() plus summaries() Group data for grouped summaries
mtcars |> 
  group_by(cyl) |> 
  summarise(avg_mpg = mean(mpg))  # Average mpg by number of cylinders


# we can also add all these commands up
mtcars_new <- mtcars |> 
  filter(mpg > 20, hp < 150) |>  # Filter() select only the cars with 
  select(mpg, cyl, hp, wt, gear) |>  # select() 
  mutate(weight_kg = wt * 1000 * 0.453592) |>  # mutate()
  arrange(-mpg)         # arrange()

print(mtcars_new)

# Data cleaning ----


attach(mtcars)
Q1 <- quantile(hp, 0.25)
Q3 <- quantile(hp, 0.75)
IQR_value <- IQR(hp)
lower_bound <- Q1 - 1.5 * IQR_value
upper_bound <- Q3 + 1.5 * IQR_value
