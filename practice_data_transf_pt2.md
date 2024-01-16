# Data Transformation Part 2 Practice
Intro to Data Science
2024-01-16

- [`mutate()`](#mutate)
  - [More `flights` data examples](#more-flights-data-examples)
- [`select()`](#select)
  - [Human Freedom Index Data
    examples](#human-freedom-index-data-examples)
- [`filter()`](#filter)
  - [Flights data examples](#flights-data-examples)
- [`arrange()`](#arrange)
  - [More flights data examples](#more-flights-data-examples-1)
- [`distinct()`](#distinct)

# `mutate()`

Use **`mutate()`** to create new variables from old

## More `flights` data examples

Because most of the variables in the `hfi_data` dataset are recorded on
a 10-point scale, they don’t lend themselves to much in the way of
transformation. Instead, we return to the `flights` data to illustrate
various ways of creating new variables.

We first follow the text example to create a smaller data set of make it
easier to see what’s going on:

``` r
flights_sml <- select(flights, year:day, ends_with("delay"), distance,
air_time )
```

Use `flights_sml` for the following `mutate()` examples:

1)  Create two new variables:

``` r
mutate(flights_sml,
       gain = dep_delay - arr_delay, 
       speed = distance / air_time * 60
)
```

- Why not use `arr_delay - dep_delay`?

- Why multiply by 60 in the speed calculation?

2)  Use `mutate()` to create a logical variable that indicates whether
    or not the flight was delayed in arriving?

3)  What’s the difference between these two commands?

``` r
mutate(flights_sml, air_time_hrs = air_time/60)
```

``` r
transmute(flights_sml, air_time_hrs = air_time/60)
```

When might you prefer the second over the first?

4)  What is this doing? Explain the `%/%` and `%%` operators.

``` r
transmute(flights, dep_time,
          hour = dep_time %/% 100, 
          minute = dep_time %% 100
)
```

5)  Use the data set `flights_sml2` and modulo arithmetic to convert
    actual departure time to departure time in minutes after midnight.

``` r
flights_sml2 <- select(flights, year:day, ends_with("time") )
```

``` r
df <- mutate(flights_sml2,
       dep_hrs_after_mid = (dep_time %% 2400) %/% 100,
       dep_mins_aft_mid = 60 * dep_hrs_after_mid  + dep_time %% 100)
```

6)  Find the airline and destination and date of the 5 most delayed (in
    arrival) flights using a ranking function. How do you want to handle
    ties? Carefully read the documentation for `min_rank()`. Hint: Use
    `select()` to show the variables of most interest first.

# `select()`

Use **`select()`** to pick variables

## Human Freedom Index Data examples

``` r
hfi_data <- read_csv("data/hfi_cc_2018.csv")
```

Use `View(hfi_data)` to browse the data and refer to [this Kaggle
link](https://www.kaggle.com/gsutters/the-human-freedom-index) for
background information.

1)  Select variables by name:

``` r
# select certain variables by name
select(hfi_data, year: region)
select(hfi_data, year, countries, region, pf_score, ef_score, hf_score)

# By column number : NOT recommended in general b/c of reproducibility problems
select(hfi_data, 1:4 )

# select all columns except those between year and day
select(hfi_data, -(year:region))
```

2)  Use `select()` to reorder

``` r
# use select to put variables of most interest in front
select(hfi_data, year, countries, region, pf_score, ef_score, hf_score, everything())

# keeps all variables not explicitly mentioned - variant of select()
rename(hfi_data, country = countries)
```

3)  Use the `select()` helper functions to pick variables or groups of
    variables with similar names or distinguishing strings:

<!-- -->

1)  Select key variables and all personal freedom variables:

``` r
select(hfi_data, year, countries, region, starts_with("pf"))
```

2)  Select all rank variables

``` r
select(hfi_data, year, countries, region, ends_with("rank"))
```

3)  Select all regulation variables

``` r
select(hfi_data, year, countries, region, contains("regulation"))
```

4)  Select all regulation variables

``` r
# Select all gender- or sex-related  variables: either of these will work
select(hfi_data, year, countries, region, contains("sex"), contains("gender"))

select(hfi_data, year, countries, region, matches("sex|gender"))
```

4)  Select all the variables that:

- Contain references to \`“tax”

- Deal with “labor” freedoms

- Contain references to “identity”

- Deal with security and safety issues

- In the first 4 or last 4 columns.

# `filter()`

**`filter()`** picks observations by their values

## Flights data examples

``` r
# note the flights is a tibble - a data.frame that has been tweaked
flights  
# use View(flights) to see entire data set
```

1)  How do the variable types `int` and `dbl` differ? What is
    `TRUE + TRUE`?

2)  Identify all the day and time variables. How are they stored?

3)  What is the following doing?

``` r
mydata <- flights |> 
  filter( month == 2, day == 14) 
```

4)  Are the 2 filter commands above equivalent? If not, which do you
    prefer? What is the other one doing?

``` r
flights |> 
  filter(month == 1 | month == 2) 
flights |> 
  filter(month == 1 | 2)
```

5)  Use the blank chunk below to create 3 new data frames that
    include (a) flights going to Chicago Midway or O’Hare airport, (b)
    flights that were on time (not delayed), and (c) flights going to
    Chicago Midway or O’Hare airport that were on time. What percentage
    of flights going to either of these two airports (from NYC) were on
    time in 2013? (Hint: For now, you can do the percentage calculation
    by hand after finding the relevant numbers of rows.)

### More `filter()` examples:

``` r
# all flights in the spring: March, April, or May
flights |> 
  filter(month == 3 | month == 4 | month == 5)
flights |> 
  filter(month %in% c(3, 4, 5)) 

#  find all flights that left no more than a half hour after scheduled time
flights |> 
  filter(dep_delay <= 30)

#  find all flights that left no more than a half hour after scheduled time and arrived early
flights |> 
  filter(dep_delay <= 30 , arr_delay < 0)  

# two ways to find all flights not delayed by more than a half hour at either end
flights |> 
  filter(arr_delay <= 30, dep_delay <= 30)
flights |> 
  filter(!(arr_delay > 30 | dep_delay > 30))
```

6)  Find the flights that were more than 500 miles long and arrived
    early.

<!-- -->

7)  Find the flights that departed after midnight but no later than 7am.

<!-- -->

8)  Find the flights that departed between midnight and 8am inclusive.

<!-- -->

9)  What’s wrong with this command: `filter(flights, month = 3)` ?

10) What’s going on here: `filter(flights, month == 3, month == 4)`?

11) Why does `filter(flights, month == (3 | 4))` give us flights in
    January?!?

12) What does this command do? `filter(flights, dest = DTW)`

13) What proportion of Delta flights into DTW were delayed?

14) How many flights were missing departure times? (Hint: Use the
    `is.na()` function.)

# `arrange()`

**`arrange()`** to reorder rows of data

## More flights data examples

``` r
# order by year, then month within year, then day within month
#   2nd column breaks ties in the 1st, etc.
flights |> 
  arrange(year, month, day)

# get earliest departure time
flights |> 
  arrange(dep_time) 
flights |> 
  arrange(desc(dep_time))
```

16) What time was the earliest/latest departure?

<!-- -->

17) How are `NA` values sorted? This command displays the last few
    values and might be helpful:
    `tail(arrange(flights, desc(dep_time)))`

18) Find the top 10 longest flights based on time. Where did they all
    go? (Of course!)

# `distinct()`

**`distinct()`** to find all the unique rows in a dataset for the
specified variable or combination of variables

19) How many airplanes are represented by these flights?

``` r
flights |> 
  distinct(tailnum)
```

20) How many distinct routes are represented?

``` r
flights |> 
  distinct(origin, dest)
```

21) For how many airlines do we have flights?

<!-- -->

22) What other examples can you think of for using `distinct()` here?

<!-- -->

23) Why might these be more useful than the commands above?

``` r
flights |> 
  count(tailnum, sort = TRUE)

flights |> 
  count(origin, dest,sort = TRUE)

# or even combine to get 
flights |> 
  count(origin, dest,sort = TRUE) |> 
  arrange(n)
```