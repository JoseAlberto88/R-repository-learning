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