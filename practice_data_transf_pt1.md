# Data Transformation Part 1 Practice
Intro to Data Science
2025-01-12

- [`filter()`](#filter)
  - [Flights data examples](#flights-data-examples)
- [`arrange()`](#arrange)
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
```

    # A tibble: 336,776 × 19
        year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
       <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
     1  2013     1     1      517            515         2      830            819
     2  2013     1     1      533            529         4      850            830
     3  2013     1     1      542            540         2      923            850
     4  2013     1     1      544            545        -1     1004           1022
     5  2013     1     1      554            600        -6      812            837
     6  2013     1     1      554            558        -4      740            728
     7  2013     1     1      555            600        -5      913            854
     8  2013     1     1      557            600        -3      709            723
     9  2013     1     1      557            600        -3      838            846
    10  2013     1     1      558            600        -2      753            745
    # ℹ 336,766 more rows
    # ℹ 11 more variables: arr_delay <dbl>, carrier <chr>, flight <int>,
    #   tailnum <chr>, origin <chr>, dest <chr>, air_time <dbl>, distance <dbl>,
    #   hour <dbl>, minute <dbl>, time_hour <dttm>

``` r
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

4)  Are the 2 filter commands below equivalent? If not, which do you
    prefer? What is the other one doing?

``` r
flights |> 
  filter(month == 1 | month == 2) 
```

    # A tibble: 51,955 × 19
        year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
       <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
     1  2013     1     1      517            515         2      830            819
     2  2013     1     1      533            529         4      850            830
     3  2013     1     1      542            540         2      923            850
     4  2013     1     1      544            545        -1     1004           1022
     5  2013     1     1      554            600        -6      812            837
     6  2013     1     1      554            558        -4      740            728
     7  2013     1     1      555            600        -5      913            854
     8  2013     1     1      557            600        -3      709            723
     9  2013     1     1      557            600        -3      838            846
    10  2013     1     1      558            600        -2      753            745
    # ℹ 51,945 more rows
    # ℹ 11 more variables: arr_delay <dbl>, carrier <chr>, flight <int>,
    #   tailnum <chr>, origin <chr>, dest <chr>, air_time <dbl>, distance <dbl>,
    #   hour <dbl>, minute <dbl>, time_hour <dttm>

``` r
flights |> 
  filter(month == 1 | 2)
```

    # A tibble: 336,776 × 19
        year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
       <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
     1  2013     1     1      517            515         2      830            819
     2  2013     1     1      533            529         4      850            830
     3  2013     1     1      542            540         2      923            850
     4  2013     1     1      544            545        -1     1004           1022
     5  2013     1     1      554            600        -6      812            837
     6  2013     1     1      554            558        -4      740            728
     7  2013     1     1      555            600        -5      913            854
     8  2013     1     1      557            600        -3      709            723
     9  2013     1     1      557            600        -3      838            846
    10  2013     1     1      558            600        -2      753            745
    # ℹ 336,766 more rows
    # ℹ 11 more variables: arr_delay <dbl>, carrier <chr>, flight <int>,
    #   tailnum <chr>, origin <chr>, dest <chr>, air_time <dbl>, distance <dbl>,
    #   hour <dbl>, minute <dbl>, time_hour <dttm>

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
```

    # A tibble: 85,960 × 19
        year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
       <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
     1  2013     3     1        4           2159       125      318             56
     2  2013     3     1       50           2358        52      526            438
     3  2013     3     1      117           2245       152      223           2354
     4  2013     3     1      454            500        -6      633            648
     5  2013     3     1      505            515       -10      746            810
     6  2013     3     1      521            530        -9      813            827
     7  2013     3     1      537            540        -3      856            850
     8  2013     3     1      541            545        -4     1014           1023
     9  2013     3     1      549            600       -11      639            703
    10  2013     3     1      550            600       -10      747            801
    # ℹ 85,950 more rows
    # ℹ 11 more variables: arr_delay <dbl>, carrier <chr>, flight <int>,
    #   tailnum <chr>, origin <chr>, dest <chr>, air_time <dbl>, distance <dbl>,
    #   hour <dbl>, minute <dbl>, time_hour <dttm>

``` r
flights |> 
  filter(month %in% c(3, 4, 5)) 
```

    # A tibble: 85,960 × 19
        year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
       <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
     1  2013     3     1        4           2159       125      318             56
     2  2013     3     1       50           2358        52      526            438
     3  2013     3     1      117           2245       152      223           2354
     4  2013     3     1      454            500        -6      633            648
     5  2013     3     1      505            515       -10      746            810
     6  2013     3     1      521            530        -9      813            827
     7  2013     3     1      537            540        -3      856            850
     8  2013     3     1      541            545        -4     1014           1023
     9  2013     3     1      549            600       -11      639            703
    10  2013     3     1      550            600       -10      747            801
    # ℹ 85,950 more rows
    # ℹ 11 more variables: arr_delay <dbl>, carrier <chr>, flight <int>,
    #   tailnum <chr>, origin <chr>, dest <chr>, air_time <dbl>, distance <dbl>,
    #   hour <dbl>, minute <dbl>, time_hour <dttm>

``` r
#  find all flights that left no more than a half hour after scheduled time
flights |> 
  filter(dep_delay <= 30)
```

    # A tibble: 280,230 × 19
        year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
       <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
     1  2013     1     1      517            515         2      830            819
     2  2013     1     1      533            529         4      850            830
     3  2013     1     1      542            540         2      923            850
     4  2013     1     1      544            545        -1     1004           1022
     5  2013     1     1      554            600        -6      812            837
     6  2013     1     1      554            558        -4      740            728
     7  2013     1     1      555            600        -5      913            854
     8  2013     1     1      557            600        -3      709            723
     9  2013     1     1      557            600        -3      838            846
    10  2013     1     1      558            600        -2      753            745
    # ℹ 280,220 more rows
    # ℹ 11 more variables: arr_delay <dbl>, carrier <chr>, flight <int>,
    #   tailnum <chr>, origin <chr>, dest <chr>, air_time <dbl>, distance <dbl>,
    #   hour <dbl>, minute <dbl>, time_hour <dttm>

``` r
#  find all flights that left no more than a half hour after scheduled time and arrived early
flights |> 
  filter(dep_delay <= 30 , arr_delay < 0)  
```

    # A tibble: 188,536 × 19
        year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
       <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
     1  2013     1     1      544            545        -1     1004           1022
     2  2013     1     1      554            600        -6      812            837
     3  2013     1     1      557            600        -3      709            723
     4  2013     1     1      557            600        -3      838            846
     5  2013     1     1      558            600        -2      849            851
     6  2013     1     1      558            600        -2      853            856
     7  2013     1     1      558            600        -2      923            937
     8  2013     1     1      559            559         0      702            706
     9  2013     1     1      559            600        -1      854            902
    10  2013     1     1      600            600         0      851            858
    # ℹ 188,526 more rows
    # ℹ 11 more variables: arr_delay <dbl>, carrier <chr>, flight <int>,
    #   tailnum <chr>, origin <chr>, dest <chr>, air_time <dbl>, distance <dbl>,
    #   hour <dbl>, minute <dbl>, time_hour <dttm>

``` r
# two ways to find all flights not delayed by more than a half hour at either end
flights |> 
  filter(arr_delay <= 30, dep_delay <= 30)
```

    # A tibble: 267,842 × 19
        year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
       <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
     1  2013     1     1      517            515         2      830            819
     2  2013     1     1      533            529         4      850            830
     3  2013     1     1      544            545        -1     1004           1022
     4  2013     1     1      554            600        -6      812            837
     5  2013     1     1      554            558        -4      740            728
     6  2013     1     1      555            600        -5      913            854
     7  2013     1     1      557            600        -3      709            723
     8  2013     1     1      557            600        -3      838            846
     9  2013     1     1      558            600        -2      753            745
    10  2013     1     1      558            600        -2      849            851
    # ℹ 267,832 more rows
    # ℹ 11 more variables: arr_delay <dbl>, carrier <chr>, flight <int>,
    #   tailnum <chr>, origin <chr>, dest <chr>, air_time <dbl>, distance <dbl>,
    #   hour <dbl>, minute <dbl>, time_hour <dttm>

``` r
flights |> 
  filter(!(arr_delay > 30 | dep_delay > 30))
```

    # A tibble: 267,842 × 19
        year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
       <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
     1  2013     1     1      517            515         2      830            819
     2  2013     1     1      533            529         4      850            830
     3  2013     1     1      544            545        -1     1004           1022
     4  2013     1     1      554            600        -6      812            837
     5  2013     1     1      554            558        -4      740            728
     6  2013     1     1      555            600        -5      913            854
     7  2013     1     1      557            600        -3      709            723
     8  2013     1     1      557            600        -3      838            846
     9  2013     1     1      558            600        -2      753            745
    10  2013     1     1      558            600        -2      849            851
    # ℹ 267,832 more rows
    # ℹ 11 more variables: arr_delay <dbl>, carrier <chr>, flight <int>,
    #   tailnum <chr>, origin <chr>, dest <chr>, air_time <dbl>, distance <dbl>,
    #   hour <dbl>, minute <dbl>, time_hour <dttm>

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

<!-- -->

14) How many flights were missing departure times? (Hint: Use the
    `is.na()` function.)

# `arrange()`

**`arrange()`** to reorder rows of data

15) What time was the earliest/latest departure?

<!-- -->

16) How are `NA` values sorted? This command displays the last few
    values and might be helpful:
    `tail(arrange(flights, desc(dep_time)))`

<!-- -->

17) Find the top 10 longest flights based on time. Where did they all
    go? (Of course!)

# `distinct()`

**`distinct()`** to find all the unique rows in a dataset for the
specified variable or combination of variables

18) How many airplanes are represented by these flights?

<!-- -->

19) How many distinct routes are represented?

<!-- -->

20) For how many airlines do we have flights?

<!-- -->

21) What other examples can you think of for using `distinct()` here?

<!-- -->

22) Why might the following examples using `count()` be more useful than
    the commands using `distinct()` above?

``` r
flights |> 
  count(tailnum, sort = TRUE)
```

    # A tibble: 4,044 × 2
       tailnum     n
       <chr>   <int>
     1 <NA>     2512
     2 N725MQ    575
     3 N722MQ    513
     4 N723MQ    507
     5 N711MQ    486
     6 N713MQ    483
     7 N258JB    427
     8 N298JB    407
     9 N353JB    404
    10 N351JB    402
    # ℹ 4,034 more rows

``` r
flights |> 
  count(origin, dest,sort = TRUE)
```

    # A tibble: 224 × 3
       origin dest      n
       <chr>  <chr> <int>
     1 JFK    LAX   11262
     2 LGA    ATL   10263
     3 LGA    ORD    8857
     4 JFK    SFO    8204
     5 LGA    CLT    6168
     6 EWR    ORD    6100
     7 JFK    BOS    5898
     8 LGA    MIA    5781
     9 JFK    MCO    5464
    10 EWR    BOS    5327
    # ℹ 214 more rows

``` r
# or even combine to get 
flights |> 
  count(origin, dest,sort = TRUE) |> 
  arrange(n)
```

    # A tibble: 224 × 3
       origin dest      n
       <chr>  <chr> <int>
     1 EWR    LGA       1
     2 JFK    BHM       1
     3 JFK    MEM       1
     4 JFK    STL       1
     5 LGA    LEX       1
     6 JFK    JAC       2
     7 LGA    MYR       3
     8 EWR    SBN       4
     9 LGA    SBN       6
    10 EWR    ANC       8
    # ℹ 214 more rows
