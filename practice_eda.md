# Chapter 10: Exploratory Data Analysis Practice
2024-02-04

**1.** Create a histogram for the `Age` variable from the NHANES
(National Health and Nutrition Examination Study ) study. What features
do you observe? Is there anything particularly problematic? Try changing
the `binwidth` to see if that affects your conclusions. Another option
to try is `breaks =` instead of `binwidth`. What do you think
`breaks = seq(0, 100, 25)` is doing? Try to use something more sensible
than that.

**Answer:**

**2.** Modify your previous chart so that height now represents the
percent in the corresponding interval. Adjust the binwidth so that you
can estimate fairly accurately the percent between the ages of 20 and
30. State your estimate. (Hint: There are several ways to get the
percent information. Try to use the `after_stat()`argument with a
formula to obtain this.)

**Answer:**

**3.** Create separate frequency polygons for the variable `BPSysAve`
for each category of the variable `BMI_WHO`. All the frequency polygons
should appear on the same graph (not faceted). What are your
observations?

**Answer:**

**4.** Now try repeating the analysis from Question 3 but create a
**ridgeline plot** as shown
[here](https://r4ds.hadley.nz/layers#sec-geometric-objects:~:text=For%20example%2C%20the%20ggridges,the%20density%20curves%20transparent.)
in the R4DS textbook. Do you prefer this view to that in Question 3? Why
or why not?

**Answer:**

**5.** In the previous questions, did you notice a substantial number of
NA values for the `BMI_WHO` variable? Do some digging and characterize
who the participants are who were missing data on this variable. What do
most of them have in common? Note: Don’t just use `View()` but instead
use the data wrangling or graphical tools we have learned.

**Answer:**
