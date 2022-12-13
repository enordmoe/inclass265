Data Transformation Part 2 Practice
================
Intro to Data Science
2021-01-19

  - [Question 1](#question-1)
  - [Question 2](#question-2)
  - [Question 3](#question-3)

Use data transformations and visual tools where needed to obtain the
following:

# Question 1

1.  All years for which Pontiac Vibe data is available. Display the
    results with the most recent years at the top.

# Question 2

2.  For each year in which Hybrid vehicles appear (use `str_detect()`),
    filter the vehicles with the minimum and maximum city mileage for
    the corresponding year. Display the values of year, make, model, and
    city mileage in order from oldest to newest.

# Question 3

3.  Identify the 5 make/model combinations with the most observations
    and save the names of the makes and models in a data set. Use these
    names to filter (Hint: `%in%`) these vehicles and create a variable
    called mid\_mileage that is the average of cty and hwy mileage. Pipe
    these cases into a `ggplot` command that creates a `stat_summary()`
    plot faceted by make/model. If the dots are too large, see if you
    can figure out show to strink them.
