# --------------------------------------------------------
# Stress Level Dataset Analysis using dplyr
# Full code combining all examples (sort, filter, multiple columns, grouping)
# Author: Ujala Yadav
# --------------------------------------------------------

# Load dplyr package
library(dplyr)

# Load your dataset
stress <- read.csv("C:/Users/UJALA YADAV/OneDrive/Desktop/DATASET/StressLevelDataset.csv")

# --------------------------------------------------------
# Example 1: Sort by stress_level (ascending)
# --------------------------------------------------------
stress_sorted <- stress |>
  arrange(stress_level)

# Show first 5 rows
head(stress_sorted, 5)

# --------------------------------------------------------
# Example 2: Sort by anxiety_level (descending)
# --------------------------------------------------------
stress_sorted_anxiety <- stress |>
  arrange(desc(anxiety_level))

# Show first 5 rows
head(stress_sorted_anxiety, 5)

# --------------------------------------------------------
# Example 3: Sort by multiple columns
# Sort first by academic_performance (ascending), then stress_level (descending)
# --------------------------------------------------------
stress_multi_sort <- stress |>
  arrange(academic_performance, desc(stress_level))

# Show first 10 rows
head(stress_multi_sort, 10)

# --------------------------------------------------------
# Example 4: Filter and sort
# Filter students with self_esteem < 5 and sort by sleep_quality
# --------------------------------------------------------
low_self_esteem <- stress |>
  filter(self_esteem < 5) |>
  arrange(sleep_quality)

cat("Top 5 low self-esteem students by sleep quality:\n")

# Show only relevant columns
print(low_self_esteem |> select(self_esteem, sleep_quality, stress_level) |> head(5))

# --------------------------------------------------------
# Example 5: Grouping and summarizing
# Average, max, min stress_level by mental_health_history
# --------------------------------------------------------
stress_summary <- stress |>
  group_by(mental_health_history) |>
  summarise(
    avg_stress = mean(stress_level, na.rm = TRUE),
    max_stress = max(stress_level, na.rm = TRUE),
    min_stress = min(stress_level, na.rm = TRUE),
    count = n()
  )

# Show the summary table
print(stress_summary)
