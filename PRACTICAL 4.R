# Install and load required packages
install.packages("dplyr")
library(dplyr)
library(readr)

# Load the dataset
students <- read_csv("C:/Users/UJALA YADAV/OneDrive/Desktop/DATASET/StudentsPerformance.csv")

# Quick look at the data structure
head(students)

# Method 1: Using subset()

# Example 1: Single Condition
# Filter students with math score greater than 90
high_math <- subset(students, `math score` > 90)
cat("Number of students with math score > 90:", nrow(high_math), "\n")
summary(high_math$`math score`)

# Example 2: Multiple Conditions (AND)
# Students with math score > 90 AND lunch is standard
high_math_standard_lunch <- subset(students, `math score` > 90 & lunch == "standard")
cat("Number of high math score students with standard lunch:", nrow(high_math_standard_lunch), "\n")
head(high_math_standard_lunch)

# Example 3: Multiple Conditions (OR)
# Students who completed test preparation OR have reading score > 95
special_students <- subset(students, `test preparation course` == "completed" | `reading score` > 95)
cat("Number of special students:", nrow(special_students), "\n")
head(special_students)

# Method 2: Using dplyr::filter()

# Example 1: Single Condition
# Students with writing score < 50
low_writing <- students |>
  filter(`writing score` < 50)
cat("Number of students with writing score < 50:", nrow(low_writing), "\n")
summary(low_writing$`writing score`)

# Example 2: Multiple Conditions (AND)
# Students who have lunch as free/reduced AND parental education level is "some college"
specific_students <- students |>
  filter(lunch == "free/reduced", `parental level of education` == "some college")
cat("Number of students with free/reduced lunch and some college parents:", nrow(specific_students), "\n")
head(specific_students)

# Example 3: Checking for values in a set (%in%)
# Students whose race/ethnicity is either group B or group C
race_filter <- students |>
  filter(`race/ethnicity` %in% c("group B", "group C"))
cat("Number of students in group B or C:", nrow(race_filter), "\n")
table(race_filter$`race/ethnicity`)
