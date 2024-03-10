library(tidyverse)

# Sample data frame
set.seed(123)  # for reproducibility
num_students <- 20
num_quizzes <-5
num_homeworks <- 7

grades <- data.frame(
  student = paste0("Student", 1:num_students),
  quiz_1 = sample(0:15, num_students, replace = TRUE),
  quiz_2 = sample(0:15, num_students, replace = TRUE),
  quiz_3 = sample(0:15, num_students, replace = TRUE),
  quiz_4 = sample(0:15, num_students, replace = TRUE),
  quiz_5 = sample(0:15, num_students, replace = TRUE),
  homework_1 = sample(0:10, num_students, replace = TRUE),
  homework_2 = sample(0:10, num_students, replace = TRUE),
  homework_3 = sample(0:10, num_students, replace = TRUE),
  homework_4 = sample(0:10, num_students, replace = TRUE),
  homework_5 = sample(0:10, num_students, replace = TRUE),
  homework_6 = sample(0:10, num_students, replace = TRUE),
  homework_7 = sample(0:10, num_students, replace = TRUE)
)

grades

# Compute quiz and homework scores
# Average of quizzes after dropping lowest
# Average of homeworks after dropping 2 lowest 
grades_calc <- grades %>%
  rowwise() %>%
  mutate(
    quiz_score = mean(sort(c_across(starts_with("quiz_")))[2:5]),
    homework_score = mean(sort(c_across(starts_with("homework_")))[3:7])
  ) |> 
  relocate(quiz_score, homework_score, .after = student)

# View the results
grades_calc
