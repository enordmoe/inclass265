# Data Transformation Part 1 Practice
Intro to Data Science
2025-01-12

- [`filter()`](#filter)
  - [Flights data examples](#flights-data-examples)
- [`arrange()`](#arrange)
  - [More flights data examples](#more-flights-data-examples)
- [`distinct()`](#distinct)

**Note:** Never put the backwards tick marks in the body of the R
chunks. I use them in the text here such as in `filter()` below so that
the commands names are clearer after rendering.

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
