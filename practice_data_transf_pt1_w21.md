Data Transformation Part 1 Practice
================
Intro to Data Science
2021-01-14

  - [`filter()`](#filter)
      - [Flights data examples](#flights-data-examples)
  - [`arrange()`](#arrange)
      - [More flights data examples](#more-flights-data-examples)
  - [`select()`](#select)
      - [Human Freedom Index Data
        examples](#human-freedom-index-data-examples)
  - [`mutate()`](#mutate)
      - [More `flights` data examples](#more-flights-data-examples-1)

**Note:** Never put the backwards tick marks in the body of the R
chunks. I use them in the text here such as in `filter()`below so that
the commands names are clearer after you knit.

# `filter()`

**`filter()`** picks observations by their values

## Flights data examples

``` r
flights  # note the flights is a tibble - a data.frame that has been tweaked
```

    ## # A tibble: 336,776 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      544            545        -1     1004           1022
    ##  5  2013     1     1      554            600        -6      812            837
    ##  6  2013     1     1      554            558        -4      740            728
    ##  7  2013     1     1      555            600        -5      913            854
    ##  8  2013     1     1      557            600        -3      709            723
    ##  9  2013     1     1      557            600        -3      838            846
    ## 10  2013     1     1      558            600        -2      753            745
    ## # … with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

``` r
# use View(flights) to see entire data set
```

1)  How do the variable types `int` and `dbl` differ? What is `TRUE +
    TRUE`?

2)  Find all the day and time variables. How are they stored?

<!-- end list -->

``` r
filter(flights, month == 1, day == 1) 
```

    ## # A tibble: 842 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      544            545        -1     1004           1022
    ##  5  2013     1     1      554            600        -6      812            837
    ##  6  2013     1     1      554            558        -4      740            728
    ##  7  2013     1     1      555            600        -5      913            854
    ##  8  2013     1     1      557            600        -3      709            723
    ##  9  2013     1     1      557            600        -3      838            846
    ## 10  2013     1     1      558            600        -2      753            745
    ## # … with 832 more rows, and 11 more variables: arr_delay <dbl>, carrier <chr>,
    ## #   flight <int>, tailnum <chr>, origin <chr>, dest <chr>, air_time <dbl>,
    ## #   distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

``` r
(jan1 <- filter(flights, month == 1, day == 1))
```

    ## # A tibble: 842 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      544            545        -1     1004           1022
    ##  5  2013     1     1      554            600        -6      812            837
    ##  6  2013     1     1      554            558        -4      740            728
    ##  7  2013     1     1      555            600        -5      913            854
    ##  8  2013     1     1      557            600        -3      709            723
    ##  9  2013     1     1      557            600        -3      838            846
    ## 10  2013     1     1      558            600        -2      753            745
    ## # … with 832 more rows, and 11 more variables: arr_delay <dbl>, carrier <chr>,
    ## #   flight <int>, tailnum <chr>, origin <chr>, dest <chr>, air_time <dbl>,
    ## #   distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

3)  How do the 2 `filter` lines above differ?

<!-- end list -->

``` r
filter(flights, month == 1 | month == 2) 
```

    ## # A tibble: 51,955 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      544            545        -1     1004           1022
    ##  5  2013     1     1      554            600        -6      812            837
    ##  6  2013     1     1      554            558        -4      740            728
    ##  7  2013     1     1      555            600        -5      913            854
    ##  8  2013     1     1      557            600        -3      709            723
    ##  9  2013     1     1      557            600        -3      838            846
    ## 10  2013     1     1      558            600        -2      753            745
    ## # … with 51,945 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

``` r
filter(flights, month == 1 | 2) 
```

    ## # A tibble: 336,776 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      544            545        -1     1004           1022
    ##  5  2013     1     1      554            600        -6      812            837
    ##  6  2013     1     1      554            558        -4      740            728
    ##  7  2013     1     1      555            600        -5      913            854
    ##  8  2013     1     1      557            600        -3      709            723
    ##  9  2013     1     1      557            600        -3      838            846
    ## 10  2013     1     1      558            600        -2      753            745
    ## # … with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

4)  Are the 2 filter commands above equivalent? If not, which do you
    prefer? What is the other one doing?

5)  Create 3 new data frames that include (a) flights going to Chicago
    Midway or O’Hare airport, (b) flights that were on time (not
    delayed), and (c) flights going to Chicago Midway or O’Hare airport
    that were on time. What percentage of flights going to either of
    these two airports (from NYC) were on time in 2013?

### `filter()` examples:

``` r
# all flights in the spring: March, April, or May
filter(flights, month == 3 | month == 4 | month == 5)
```

    ## # A tibble: 85,960 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     3     1        4           2159       125      318             56
    ##  2  2013     3     1       50           2358        52      526            438
    ##  3  2013     3     1      117           2245       152      223           2354
    ##  4  2013     3     1      454            500        -6      633            648
    ##  5  2013     3     1      505            515       -10      746            810
    ##  6  2013     3     1      521            530        -9      813            827
    ##  7  2013     3     1      537            540        -3      856            850
    ##  8  2013     3     1      541            545        -4     1014           1023
    ##  9  2013     3     1      549            600       -11      639            703
    ## 10  2013     3     1      550            600       -10      747            801
    ## # … with 85,950 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

``` r
filter(flights, month %in% c(3, 4, 5)) 
```

    ## # A tibble: 85,960 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     3     1        4           2159       125      318             56
    ##  2  2013     3     1       50           2358        52      526            438
    ##  3  2013     3     1      117           2245       152      223           2354
    ##  4  2013     3     1      454            500        -6      633            648
    ##  5  2013     3     1      505            515       -10      746            810
    ##  6  2013     3     1      521            530        -9      813            827
    ##  7  2013     3     1      537            540        -3      856            850
    ##  8  2013     3     1      541            545        -4     1014           1023
    ##  9  2013     3     1      549            600       -11      639            703
    ## 10  2013     3     1      550            600       -10      747            801
    ## # … with 85,950 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

``` r
#  find all flights that left no more than a half hour after scheduled time
filter(flights, dep_delay <= 30)
```

    ## # A tibble: 280,230 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      544            545        -1     1004           1022
    ##  5  2013     1     1      554            600        -6      812            837
    ##  6  2013     1     1      554            558        -4      740            728
    ##  7  2013     1     1      555            600        -5      913            854
    ##  8  2013     1     1      557            600        -3      709            723
    ##  9  2013     1     1      557            600        -3      838            846
    ## 10  2013     1     1      558            600        -2      753            745
    ## # … with 280,220 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

``` r
#  find all flights that left no more than a half hour after scheduled time and arrived early
filter(flights, dep_delay <= 30 , arr_delay < 0)  
```

    ## # A tibble: 188,536 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      544            545        -1     1004           1022
    ##  2  2013     1     1      554            600        -6      812            837
    ##  3  2013     1     1      557            600        -3      709            723
    ##  4  2013     1     1      557            600        -3      838            846
    ##  5  2013     1     1      558            600        -2      849            851
    ##  6  2013     1     1      558            600        -2      853            856
    ##  7  2013     1     1      558            600        -2      923            937
    ##  8  2013     1     1      559            559         0      702            706
    ##  9  2013     1     1      559            600        -1      854            902
    ## 10  2013     1     1      600            600         0      851            858
    ## # … with 188,526 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

``` r
# two ways to find all flights not delayed by more than a half hour at either end
filter(flights, arr_delay <= 30, dep_delay <= 30)
```

    ## # A tibble: 267,842 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      544            545        -1     1004           1022
    ##  4  2013     1     1      554            600        -6      812            837
    ##  5  2013     1     1      554            558        -4      740            728
    ##  6  2013     1     1      555            600        -5      913            854
    ##  7  2013     1     1      557            600        -3      709            723
    ##  8  2013     1     1      557            600        -3      838            846
    ##  9  2013     1     1      558            600        -2      753            745
    ## 10  2013     1     1      558            600        -2      849            851
    ## # … with 267,832 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

``` r
filter(flights, !(arr_delay > 30 | dep_delay > 30))
```

    ## # A tibble: 267,842 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      544            545        -1     1004           1022
    ##  4  2013     1     1      554            600        -6      812            837
    ##  5  2013     1     1      554            558        -4      740            728
    ##  6  2013     1     1      555            600        -5      913            854
    ##  7  2013     1     1      557            600        -3      709            723
    ##  8  2013     1     1      557            600        -3      838            846
    ##  9  2013     1     1      558            600        -2      753            745
    ## 10  2013     1     1      558            600        -2      849            851
    ## # … with 267,832 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

6)  Find the flights that were more than 500 miles long and arrived
    early.

7)  Find the flights that departed after midnight but no later than 7am.

8)  Find the flights that departed between midnight and 8am inclusive.

9)  What would happen if you tried `filter(flights, month == 3, month
    == 4)`?

10) How about `filter(flights, month = 3)`?

11) Why does `filter(flights, month == (3 | 4))` give us flights in
    January?\!?

12) What does this command do? `filter(flights, dest = DTW)`

13) What proportion of Delta flights into DTW were delayed?

14) How many flights were missing departure times? (Hint: Use the
    `is.na()` function.)

15) Missing values (NAs) are a part of life whenever we are dealing with
    real data. Construct a general rule for how NAs are handled in R.
    Consider examples like: `NA + 5`, `NA > 2`, `NA ^ 0`, `NA | TRUE`,
    `FALSE & NA`, `NA*0`.

# `arrange()`

**`arrange()`** to reorder rows of data

## More flights data examples

``` r
# order by year, then month within year, then day within month
#   2nd column breaks ties in the 1st, etc.
arrange(flights, year, month, day)
```

    ## # A tibble: 336,776 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      544            545        -1     1004           1022
    ##  5  2013     1     1      554            600        -6      812            837
    ##  6  2013     1     1      554            558        -4      740            728
    ##  7  2013     1     1      555            600        -5      913            854
    ##  8  2013     1     1      557            600        -3      709            723
    ##  9  2013     1     1      557            600        -3      838            846
    ## 10  2013     1     1      558            600        -2      753            745
    ## # … with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

``` r
# get earliest departure time
arrange(flights, dep_time) 
```

    ## # A tibble: 336,776 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1    13        1           2249        72      108           2357
    ##  2  2013     1    31        1           2100       181      124           2225
    ##  3  2013    11    13        1           2359         2      442            440
    ##  4  2013    12    16        1           2359         2      447            437
    ##  5  2013    12    20        1           2359         2      430            440
    ##  6  2013    12    26        1           2359         2      437            440
    ##  7  2013    12    30        1           2359         2      441            437
    ##  8  2013     2    11        1           2100       181      111           2225
    ##  9  2013     2    24        1           2245        76      121           2354
    ## 10  2013     3     8        1           2355         6      431            440
    ## # … with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

``` r
arrange(flights, desc(dep_time))
```

    ## # A tibble: 336,776 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013    10    30     2400           2359         1      327            337
    ##  2  2013    11    27     2400           2359         1      515            445
    ##  3  2013    12     5     2400           2359         1      427            440
    ##  4  2013    12     9     2400           2359         1      432            440
    ##  5  2013    12     9     2400           2250        70       59           2356
    ##  6  2013    12    13     2400           2359         1      432            440
    ##  7  2013    12    19     2400           2359         1      434            440
    ##  8  2013    12    29     2400           1700       420      302           2025
    ##  9  2013     2     7     2400           2359         1      432            436
    ## 10  2013     2     7     2400           2359         1      443            444
    ## # … with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

16) What time was the earliest departure?

17) How are `NA` values sorted? This command displays the last few
    values and might be helpful: `tail(arrange(flights,
    desc(dep_time)))`

18) Find the top 10 longest flights. Where did they all go?

# `select()`

Use **`select()`** to pick variables

## Human Freedom Index Data examples

``` r
hfi_data <- read_csv("data/hfi_cc_2018.csv")
```

    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   .default = col_double(),
    ##   ISO_code = col_character(),
    ##   countries = col_character(),
    ##   region = col_character()
    ## )
    ## ℹ Use `spec()` for the full column specifications.

Use `View(hfi_data)` to browse the data and refer to [this Kaggle
link](https://www.kaggle.com/gsutters/the-human-freedom-index) for
background information.

1)  Select variables by name:

<!-- end list -->

``` r
# select certain variables by name
select(hfi_data, year: region)
```

    ## # A tibble: 1,458 x 4
    ##     year ISO_code countries  region                       
    ##    <dbl> <chr>    <chr>      <chr>                        
    ##  1  2016 ALB      Albania    Eastern Europe               
    ##  2  2016 DZA      Algeria    Middle East & North Africa   
    ##  3  2016 AGO      Angola     Sub-Saharan Africa           
    ##  4  2016 ARG      Argentina  Latin America & the Caribbean
    ##  5  2016 ARM      Armenia    Caucasus & Central Asia      
    ##  6  2016 AUS      Australia  Oceania                      
    ##  7  2016 AUT      Austria    Western Europe               
    ##  8  2016 AZE      Azerbaijan Caucasus & Central Asia      
    ##  9  2016 BHS      Bahamas    Latin America & the Caribbean
    ## 10  2016 BHR      Bahrain    Middle East & North Africa   
    ## # … with 1,448 more rows

``` r
select(hfi_data, year, countries, region, pf_score, ef_score, hf_score)
```

    ## # A tibble: 1,458 x 6
    ##     year countries  region                        pf_score ef_score hf_score
    ##    <dbl> <chr>      <chr>                            <dbl>    <dbl>    <dbl>
    ##  1  2016 Albania    Eastern Europe                    7.60     7.54     7.57
    ##  2  2016 Algeria    Middle East & North Africa        5.28     4.99     5.14
    ##  3  2016 Angola     Sub-Saharan Africa                6.11     5.17     5.64
    ##  4  2016 Argentina  Latin America & the Caribbean     8.10     4.84     6.47
    ##  5  2016 Armenia    Caucasus & Central Asia           6.91     7.57     7.24
    ##  6  2016 Australia  Oceania                           9.18     7.98     8.58
    ##  7  2016 Austria    Western Europe                    9.25     7.58     8.41
    ##  8  2016 Azerbaijan Caucasus & Central Asia           5.68     6.49     6.08
    ##  9  2016 Bahamas    Latin America & the Caribbean     7.45     7.34     7.40
    ## 10  2016 Bahrain    Middle East & North Africa        6.14     7.56     6.85
    ## # … with 1,448 more rows

``` r
# By column number : NOT recommended in general b/c of reproducibility problems
select(hfi_data, 1:4 )
```

    ## # A tibble: 1,458 x 4
    ##     year ISO_code countries  region                       
    ##    <dbl> <chr>    <chr>      <chr>                        
    ##  1  2016 ALB      Albania    Eastern Europe               
    ##  2  2016 DZA      Algeria    Middle East & North Africa   
    ##  3  2016 AGO      Angola     Sub-Saharan Africa           
    ##  4  2016 ARG      Argentina  Latin America & the Caribbean
    ##  5  2016 ARM      Armenia    Caucasus & Central Asia      
    ##  6  2016 AUS      Australia  Oceania                      
    ##  7  2016 AUT      Austria    Western Europe               
    ##  8  2016 AZE      Azerbaijan Caucasus & Central Asia      
    ##  9  2016 BHS      Bahamas    Latin America & the Caribbean
    ## 10  2016 BHR      Bahrain    Middle East & North Africa   
    ## # … with 1,448 more rows

``` r
# select all columns except those between year and day
select(hfi_data, -(year:region))
```

    ## # A tibble: 1,458 x 119
    ##    pf_rol_procedur… pf_rol_civil pf_rol_criminal pf_rol pf_ss_homicide
    ##               <dbl>        <dbl>           <dbl>  <dbl>          <dbl>
    ##  1             6.66         4.55            4.67   5.29           8.92
    ##  2            NA           NA              NA      3.82           9.46
    ##  3            NA           NA              NA      3.45           8.06
    ##  4             7.10         5.79            4.34   5.74           7.62
    ##  5            NA           NA              NA      5.00           8.81
    ##  6             8.44         7.53            7.36   7.78           9.62
    ##  7             8.97         7.87            7.67   8.17           9.74
    ##  8            NA           NA              NA      4.27           9.14
    ##  9             6.93         6.01            6.26   6.40           0   
    ## 10            NA           NA              NA      5.90           9.79
    ## # … with 1,448 more rows, and 114 more variables:
    ## #   pf_ss_disappearances_disap <dbl>, pf_ss_disappearances_violent <dbl>,
    ## #   pf_ss_disappearances_organized <dbl>,
    ## #   pf_ss_disappearances_fatalities <dbl>, pf_ss_disappearances_injuries <dbl>,
    ## #   pf_ss_disappearances <dbl>, pf_ss_women_fgm <dbl>,
    ## #   pf_ss_women_missing <dbl>, pf_ss_women_inheritance_widows <dbl>,
    ## #   pf_ss_women_inheritance_daughters <dbl>, pf_ss_women_inheritance <dbl>,
    ## #   pf_ss_women <dbl>, pf_ss <dbl>, pf_movement_domestic <dbl>,
    ## #   pf_movement_foreign <dbl>, pf_movement_women <dbl>, pf_movement <dbl>,
    ## #   pf_religion_estop_establish <dbl>, pf_religion_estop_operate <dbl>,
    ## #   pf_religion_estop <dbl>, pf_religion_harassment <dbl>,
    ## #   pf_religion_restrictions <dbl>, pf_religion <dbl>,
    ## #   pf_association_association <dbl>, pf_association_assembly <dbl>,
    ## #   pf_association_political_establish <dbl>,
    ## #   pf_association_political_operate <dbl>, pf_association_political <dbl>,
    ## #   pf_association_prof_establish <dbl>, pf_association_prof_operate <dbl>,
    ## #   pf_association_prof <dbl>, pf_association_sport_establish <dbl>,
    ## #   pf_association_sport_operate <dbl>, pf_association_sport <dbl>,
    ## #   pf_association <dbl>, pf_expression_killed <dbl>,
    ## #   pf_expression_jailed <dbl>, pf_expression_influence <dbl>,
    ## #   pf_expression_control <dbl>, pf_expression_cable <dbl>,
    ## #   pf_expression_newspapers <dbl>, pf_expression_internet <dbl>,
    ## #   pf_expression <dbl>, pf_identity_legal <dbl>,
    ## #   pf_identity_parental_marriage <dbl>, pf_identity_parental_divorce <dbl>,
    ## #   pf_identity_parental <dbl>, pf_identity_sex_male <dbl>,
    ## #   pf_identity_sex_female <dbl>, pf_identity_sex <dbl>,
    ## #   pf_identity_divorce <dbl>, pf_identity <dbl>, pf_score <dbl>,
    ## #   pf_rank <dbl>, ef_government_consumption <dbl>,
    ## #   ef_government_transfers <dbl>, ef_government_enterprises <dbl>,
    ## #   ef_government_tax_income <dbl>, ef_government_tax_payroll <dbl>,
    ## #   ef_government_tax <dbl>, ef_government <dbl>, ef_legal_judicial <dbl>,
    ## #   ef_legal_courts <dbl>, ef_legal_protection <dbl>, ef_legal_military <dbl>,
    ## #   ef_legal_integrity <dbl>, ef_legal_enforcement <dbl>,
    ## #   ef_legal_restrictions <dbl>, ef_legal_police <dbl>, ef_legal_crime <dbl>,
    ## #   ef_legal_gender <dbl>, ef_legal <dbl>, ef_money_growth <dbl>,
    ## #   ef_money_sd <dbl>, ef_money_inflation <dbl>, ef_money_currency <dbl>,
    ## #   ef_money <dbl>, ef_trade_tariffs_revenue <dbl>,
    ## #   ef_trade_tariffs_mean <dbl>, ef_trade_tariffs_sd <dbl>,
    ## #   ef_trade_tariffs <dbl>, ef_trade_regulatory_nontariff <dbl>,
    ## #   ef_trade_regulatory_compliance <dbl>, ef_trade_regulatory <dbl>,
    ## #   ef_trade_black <dbl>, ef_trade_movement_foreign <dbl>,
    ## #   ef_trade_movement_capital <dbl>, ef_trade_movement_visit <dbl>,
    ## #   ef_trade_movement <dbl>, ef_trade <dbl>,
    ## #   ef_regulation_credit_ownership <dbl>, ef_regulation_credit_private <dbl>,
    ## #   ef_regulation_credit_interest <dbl>, ef_regulation_credit <dbl>,
    ## #   ef_regulation_labor_minwage <dbl>, ef_regulation_labor_firing <dbl>,
    ## #   ef_regulation_labor_bargain <dbl>, ef_regulation_labor_hours <dbl>,
    ## #   ef_regulation_labor_dismissal <dbl>,
    ## #   ef_regulation_labor_conscription <dbl>, …

2)  Use `select()` to reorder

<!-- end list -->

``` r
# use select to put variables of most interest in front
select(hfi_data, year, countries, region, pf_score, ef_score, hf_score, everything())
```

    ## # A tibble: 1,458 x 123
    ##     year countries region pf_score ef_score hf_score ISO_code pf_rol_procedur…
    ##    <dbl> <chr>     <chr>     <dbl>    <dbl>    <dbl> <chr>               <dbl>
    ##  1  2016 Albania   Easte…     7.60     7.54     7.57 ALB                  6.66
    ##  2  2016 Algeria   Middl…     5.28     4.99     5.14 DZA                 NA   
    ##  3  2016 Angola    Sub-S…     6.11     5.17     5.64 AGO                 NA   
    ##  4  2016 Argentina Latin…     8.10     4.84     6.47 ARG                  7.10
    ##  5  2016 Armenia   Cauca…     6.91     7.57     7.24 ARM                 NA   
    ##  6  2016 Australia Ocean…     9.18     7.98     8.58 AUS                  8.44
    ##  7  2016 Austria   Weste…     9.25     7.58     8.41 AUT                  8.97
    ##  8  2016 Azerbaij… Cauca…     5.68     6.49     6.08 AZE                 NA   
    ##  9  2016 Bahamas   Latin…     7.45     7.34     7.40 BHS                  6.93
    ## 10  2016 Bahrain   Middl…     6.14     7.56     6.85 BHR                 NA   
    ## # … with 1,448 more rows, and 115 more variables: pf_rol_civil <dbl>,
    ## #   pf_rol_criminal <dbl>, pf_rol <dbl>, pf_ss_homicide <dbl>,
    ## #   pf_ss_disappearances_disap <dbl>, pf_ss_disappearances_violent <dbl>,
    ## #   pf_ss_disappearances_organized <dbl>,
    ## #   pf_ss_disappearances_fatalities <dbl>, pf_ss_disappearances_injuries <dbl>,
    ## #   pf_ss_disappearances <dbl>, pf_ss_women_fgm <dbl>,
    ## #   pf_ss_women_missing <dbl>, pf_ss_women_inheritance_widows <dbl>,
    ## #   pf_ss_women_inheritance_daughters <dbl>, pf_ss_women_inheritance <dbl>,
    ## #   pf_ss_women <dbl>, pf_ss <dbl>, pf_movement_domestic <dbl>,
    ## #   pf_movement_foreign <dbl>, pf_movement_women <dbl>, pf_movement <dbl>,
    ## #   pf_religion_estop_establish <dbl>, pf_religion_estop_operate <dbl>,
    ## #   pf_religion_estop <dbl>, pf_religion_harassment <dbl>,
    ## #   pf_religion_restrictions <dbl>, pf_religion <dbl>,
    ## #   pf_association_association <dbl>, pf_association_assembly <dbl>,
    ## #   pf_association_political_establish <dbl>,
    ## #   pf_association_political_operate <dbl>, pf_association_political <dbl>,
    ## #   pf_association_prof_establish <dbl>, pf_association_prof_operate <dbl>,
    ## #   pf_association_prof <dbl>, pf_association_sport_establish <dbl>,
    ## #   pf_association_sport_operate <dbl>, pf_association_sport <dbl>,
    ## #   pf_association <dbl>, pf_expression_killed <dbl>,
    ## #   pf_expression_jailed <dbl>, pf_expression_influence <dbl>,
    ## #   pf_expression_control <dbl>, pf_expression_cable <dbl>,
    ## #   pf_expression_newspapers <dbl>, pf_expression_internet <dbl>,
    ## #   pf_expression <dbl>, pf_identity_legal <dbl>,
    ## #   pf_identity_parental_marriage <dbl>, pf_identity_parental_divorce <dbl>,
    ## #   pf_identity_parental <dbl>, pf_identity_sex_male <dbl>,
    ## #   pf_identity_sex_female <dbl>, pf_identity_sex <dbl>,
    ## #   pf_identity_divorce <dbl>, pf_identity <dbl>, pf_rank <dbl>,
    ## #   ef_government_consumption <dbl>, ef_government_transfers <dbl>,
    ## #   ef_government_enterprises <dbl>, ef_government_tax_income <dbl>,
    ## #   ef_government_tax_payroll <dbl>, ef_government_tax <dbl>,
    ## #   ef_government <dbl>, ef_legal_judicial <dbl>, ef_legal_courts <dbl>,
    ## #   ef_legal_protection <dbl>, ef_legal_military <dbl>,
    ## #   ef_legal_integrity <dbl>, ef_legal_enforcement <dbl>,
    ## #   ef_legal_restrictions <dbl>, ef_legal_police <dbl>, ef_legal_crime <dbl>,
    ## #   ef_legal_gender <dbl>, ef_legal <dbl>, ef_money_growth <dbl>,
    ## #   ef_money_sd <dbl>, ef_money_inflation <dbl>, ef_money_currency <dbl>,
    ## #   ef_money <dbl>, ef_trade_tariffs_revenue <dbl>,
    ## #   ef_trade_tariffs_mean <dbl>, ef_trade_tariffs_sd <dbl>,
    ## #   ef_trade_tariffs <dbl>, ef_trade_regulatory_nontariff <dbl>,
    ## #   ef_trade_regulatory_compliance <dbl>, ef_trade_regulatory <dbl>,
    ## #   ef_trade_black <dbl>, ef_trade_movement_foreign <dbl>,
    ## #   ef_trade_movement_capital <dbl>, ef_trade_movement_visit <dbl>,
    ## #   ef_trade_movement <dbl>, ef_trade <dbl>,
    ## #   ef_regulation_credit_ownership <dbl>, ef_regulation_credit_private <dbl>,
    ## #   ef_regulation_credit_interest <dbl>, ef_regulation_credit <dbl>,
    ## #   ef_regulation_labor_minwage <dbl>, ef_regulation_labor_firing <dbl>,
    ## #   ef_regulation_labor_bargain <dbl>, …

``` r
# keeps all variables not explicitly mentioned - variant of select()
rename(hfi_data, country = countries)
```

    ## # A tibble: 1,458 x 123
    ##     year ISO_code country region pf_rol_procedur… pf_rol_civil pf_rol_criminal
    ##    <dbl> <chr>    <chr>   <chr>             <dbl>        <dbl>           <dbl>
    ##  1  2016 ALB      Albania Easte…             6.66         4.55            4.67
    ##  2  2016 DZA      Algeria Middl…            NA           NA              NA   
    ##  3  2016 AGO      Angola  Sub-S…            NA           NA              NA   
    ##  4  2016 ARG      Argent… Latin…             7.10         5.79            4.34
    ##  5  2016 ARM      Armenia Cauca…            NA           NA              NA   
    ##  6  2016 AUS      Austra… Ocean…             8.44         7.53            7.36
    ##  7  2016 AUT      Austria Weste…             8.97         7.87            7.67
    ##  8  2016 AZE      Azerba… Cauca…            NA           NA              NA   
    ##  9  2016 BHS      Bahamas Latin…             6.93         6.01            6.26
    ## 10  2016 BHR      Bahrain Middl…            NA           NA              NA   
    ## # … with 1,448 more rows, and 116 more variables: pf_rol <dbl>,
    ## #   pf_ss_homicide <dbl>, pf_ss_disappearances_disap <dbl>,
    ## #   pf_ss_disappearances_violent <dbl>, pf_ss_disappearances_organized <dbl>,
    ## #   pf_ss_disappearances_fatalities <dbl>, pf_ss_disappearances_injuries <dbl>,
    ## #   pf_ss_disappearances <dbl>, pf_ss_women_fgm <dbl>,
    ## #   pf_ss_women_missing <dbl>, pf_ss_women_inheritance_widows <dbl>,
    ## #   pf_ss_women_inheritance_daughters <dbl>, pf_ss_women_inheritance <dbl>,
    ## #   pf_ss_women <dbl>, pf_ss <dbl>, pf_movement_domestic <dbl>,
    ## #   pf_movement_foreign <dbl>, pf_movement_women <dbl>, pf_movement <dbl>,
    ## #   pf_religion_estop_establish <dbl>, pf_religion_estop_operate <dbl>,
    ## #   pf_religion_estop <dbl>, pf_religion_harassment <dbl>,
    ## #   pf_religion_restrictions <dbl>, pf_religion <dbl>,
    ## #   pf_association_association <dbl>, pf_association_assembly <dbl>,
    ## #   pf_association_political_establish <dbl>,
    ## #   pf_association_political_operate <dbl>, pf_association_political <dbl>,
    ## #   pf_association_prof_establish <dbl>, pf_association_prof_operate <dbl>,
    ## #   pf_association_prof <dbl>, pf_association_sport_establish <dbl>,
    ## #   pf_association_sport_operate <dbl>, pf_association_sport <dbl>,
    ## #   pf_association <dbl>, pf_expression_killed <dbl>,
    ## #   pf_expression_jailed <dbl>, pf_expression_influence <dbl>,
    ## #   pf_expression_control <dbl>, pf_expression_cable <dbl>,
    ## #   pf_expression_newspapers <dbl>, pf_expression_internet <dbl>,
    ## #   pf_expression <dbl>, pf_identity_legal <dbl>,
    ## #   pf_identity_parental_marriage <dbl>, pf_identity_parental_divorce <dbl>,
    ## #   pf_identity_parental <dbl>, pf_identity_sex_male <dbl>,
    ## #   pf_identity_sex_female <dbl>, pf_identity_sex <dbl>,
    ## #   pf_identity_divorce <dbl>, pf_identity <dbl>, pf_score <dbl>,
    ## #   pf_rank <dbl>, ef_government_consumption <dbl>,
    ## #   ef_government_transfers <dbl>, ef_government_enterprises <dbl>,
    ## #   ef_government_tax_income <dbl>, ef_government_tax_payroll <dbl>,
    ## #   ef_government_tax <dbl>, ef_government <dbl>, ef_legal_judicial <dbl>,
    ## #   ef_legal_courts <dbl>, ef_legal_protection <dbl>, ef_legal_military <dbl>,
    ## #   ef_legal_integrity <dbl>, ef_legal_enforcement <dbl>,
    ## #   ef_legal_restrictions <dbl>, ef_legal_police <dbl>, ef_legal_crime <dbl>,
    ## #   ef_legal_gender <dbl>, ef_legal <dbl>, ef_money_growth <dbl>,
    ## #   ef_money_sd <dbl>, ef_money_inflation <dbl>, ef_money_currency <dbl>,
    ## #   ef_money <dbl>, ef_trade_tariffs_revenue <dbl>,
    ## #   ef_trade_tariffs_mean <dbl>, ef_trade_tariffs_sd <dbl>,
    ## #   ef_trade_tariffs <dbl>, ef_trade_regulatory_nontariff <dbl>,
    ## #   ef_trade_regulatory_compliance <dbl>, ef_trade_regulatory <dbl>,
    ## #   ef_trade_black <dbl>, ef_trade_movement_foreign <dbl>,
    ## #   ef_trade_movement_capital <dbl>, ef_trade_movement_visit <dbl>,
    ## #   ef_trade_movement <dbl>, ef_trade <dbl>,
    ## #   ef_regulation_credit_ownership <dbl>, ef_regulation_credit_private <dbl>,
    ## #   ef_regulation_credit_interest <dbl>, ef_regulation_credit <dbl>,
    ## #   ef_regulation_labor_minwage <dbl>, ef_regulation_labor_firing <dbl>,
    ## #   ef_regulation_labor_bargain <dbl>, ef_regulation_labor_hours <dbl>, …

3)  Use the `select()` helper functions to pick variables or groups of
    variables with similar names or distinguishing strings:

<!-- end list -->

1)  Select key variables and all personal freedom variables:

<!-- end list -->

``` r
select(hfi_data, year, countries, region, starts_with("pf"))
```

    ## # A tibble: 1,458 x 62
    ##     year countries region pf_rol_procedur… pf_rol_civil pf_rol_criminal pf_rol
    ##    <dbl> <chr>     <chr>             <dbl>        <dbl>           <dbl>  <dbl>
    ##  1  2016 Albania   Easte…             6.66         4.55            4.67   5.29
    ##  2  2016 Algeria   Middl…            NA           NA              NA      3.82
    ##  3  2016 Angola    Sub-S…            NA           NA              NA      3.45
    ##  4  2016 Argentina Latin…             7.10         5.79            4.34   5.74
    ##  5  2016 Armenia   Cauca…            NA           NA              NA      5.00
    ##  6  2016 Australia Ocean…             8.44         7.53            7.36   7.78
    ##  7  2016 Austria   Weste…             8.97         7.87            7.67   8.17
    ##  8  2016 Azerbaij… Cauca…            NA           NA              NA      4.27
    ##  9  2016 Bahamas   Latin…             6.93         6.01            6.26   6.40
    ## 10  2016 Bahrain   Middl…            NA           NA              NA      5.90
    ## # … with 1,448 more rows, and 55 more variables: pf_ss_homicide <dbl>,
    ## #   pf_ss_disappearances_disap <dbl>, pf_ss_disappearances_violent <dbl>,
    ## #   pf_ss_disappearances_organized <dbl>,
    ## #   pf_ss_disappearances_fatalities <dbl>, pf_ss_disappearances_injuries <dbl>,
    ## #   pf_ss_disappearances <dbl>, pf_ss_women_fgm <dbl>,
    ## #   pf_ss_women_missing <dbl>, pf_ss_women_inheritance_widows <dbl>,
    ## #   pf_ss_women_inheritance_daughters <dbl>, pf_ss_women_inheritance <dbl>,
    ## #   pf_ss_women <dbl>, pf_ss <dbl>, pf_movement_domestic <dbl>,
    ## #   pf_movement_foreign <dbl>, pf_movement_women <dbl>, pf_movement <dbl>,
    ## #   pf_religion_estop_establish <dbl>, pf_religion_estop_operate <dbl>,
    ## #   pf_religion_estop <dbl>, pf_religion_harassment <dbl>,
    ## #   pf_religion_restrictions <dbl>, pf_religion <dbl>,
    ## #   pf_association_association <dbl>, pf_association_assembly <dbl>,
    ## #   pf_association_political_establish <dbl>,
    ## #   pf_association_political_operate <dbl>, pf_association_political <dbl>,
    ## #   pf_association_prof_establish <dbl>, pf_association_prof_operate <dbl>,
    ## #   pf_association_prof <dbl>, pf_association_sport_establish <dbl>,
    ## #   pf_association_sport_operate <dbl>, pf_association_sport <dbl>,
    ## #   pf_association <dbl>, pf_expression_killed <dbl>,
    ## #   pf_expression_jailed <dbl>, pf_expression_influence <dbl>,
    ## #   pf_expression_control <dbl>, pf_expression_cable <dbl>,
    ## #   pf_expression_newspapers <dbl>, pf_expression_internet <dbl>,
    ## #   pf_expression <dbl>, pf_identity_legal <dbl>,
    ## #   pf_identity_parental_marriage <dbl>, pf_identity_parental_divorce <dbl>,
    ## #   pf_identity_parental <dbl>, pf_identity_sex_male <dbl>,
    ## #   pf_identity_sex_female <dbl>, pf_identity_sex <dbl>,
    ## #   pf_identity_divorce <dbl>, pf_identity <dbl>, pf_score <dbl>, pf_rank <dbl>

2)  Select all rank variables

<!-- end list -->

``` r
select(hfi_data, year, countries, region, ends_with("rank"))
```

    ## # A tibble: 1,458 x 6
    ##     year countries  region                        pf_rank ef_rank hf_rank
    ##    <dbl> <chr>      <chr>                           <dbl>   <dbl>   <dbl>
    ##  1  2016 Albania    Eastern Europe                     57      34      48
    ##  2  2016 Algeria    Middle East & North Africa        147     159     155
    ##  3  2016 Angola     Sub-Saharan Africa                117     155     142
    ##  4  2016 Argentina  Latin America & the Caribbean      42     160     107
    ##  5  2016 Armenia    Caucasus & Central Asia            84      29      57
    ##  6  2016 Australia  Oceania                            11      10       4
    ##  7  2016 Austria    Western Europe                      8      27      16
    ##  8  2016 Azerbaijan Caucasus & Central Asia           131     106     130
    ##  9  2016 Bahamas    Latin America & the Caribbean      64      49      50
    ## 10  2016 Bahrain    Middle East & North Africa        114      30      75
    ## # … with 1,448 more rows

3)  Select all regulation variables

<!-- end list -->

``` r
select(hfi_data, year, countries, region, contains("regulation"))
```

    ## # A tibble: 1,458 x 22
    ##     year countries region ef_regulation_c… ef_regulation_c… ef_regulation_c…
    ##    <dbl> <chr>     <chr>             <dbl>            <dbl>            <dbl>
    ##  1  2016 Albania   Easte…                5             7.30                9
    ##  2  2016 Algeria   Middl…                0             5.30               10
    ##  3  2016 Angola    Sub-S…                8             9.19                4
    ##  4  2016 Argentina Latin…                5             4.26                7
    ##  5  2016 Armenia   Cauca…               10             7.31               10
    ##  6  2016 Australia Ocean…               10             8.73               10
    ##  7  2016 Austria   Weste…                8             9.39               10
    ##  8  2016 Azerbaij… Cauca…                5             8.40                9
    ##  9  2016 Bahamas   Latin…               10             5.87               10
    ## 10  2016 Bahrain   Middl…               10             2.83               10
    ## # … with 1,448 more rows, and 16 more variables: ef_regulation_credit <dbl>,
    ## #   ef_regulation_labor_minwage <dbl>, ef_regulation_labor_firing <dbl>,
    ## #   ef_regulation_labor_bargain <dbl>, ef_regulation_labor_hours <dbl>,
    ## #   ef_regulation_labor_dismissal <dbl>,
    ## #   ef_regulation_labor_conscription <dbl>, ef_regulation_labor <dbl>,
    ## #   ef_regulation_business_adm <dbl>, ef_regulation_business_bureaucracy <dbl>,
    ## #   ef_regulation_business_start <dbl>, ef_regulation_business_bribes <dbl>,
    ## #   ef_regulation_business_licensing <dbl>,
    ## #   ef_regulation_business_compliance <dbl>, ef_regulation_business <dbl>,
    ## #   ef_regulation <dbl>

4)  Select all regulation variables

<!-- end list -->

``` r
# Select all gender- or sex-related  variables: either of these will work
select(hfi_data, year, countries, region, contains("sex"), contains("gender"))
```

    ## # A tibble: 1,458 x 7
    ##     year countries region pf_identity_sex… pf_identity_sex… pf_identity_sex
    ##    <dbl> <chr>     <chr>             <dbl>            <dbl>           <dbl>
    ##  1  2016 Albania   Easte…               10               10              10
    ##  2  2016 Algeria   Middl…                0                0               0
    ##  3  2016 Angola    Sub-S…                0                0               0
    ##  4  2016 Argentina Latin…               10               10              10
    ##  5  2016 Armenia   Cauca…               10               10              10
    ##  6  2016 Australia Ocean…               10               10              10
    ##  7  2016 Austria   Weste…               10               10              10
    ##  8  2016 Azerbaij… Cauca…               10               10              10
    ##  9  2016 Bahamas   Latin…               10               10              10
    ## 10  2016 Bahrain   Middl…               10               10              10
    ## # … with 1,448 more rows, and 1 more variable: ef_legal_gender <dbl>

``` r
select(hfi_data, year, countries, region, matches("sex|gender"))
```

    ## # A tibble: 1,458 x 7
    ##     year countries region pf_identity_sex… pf_identity_sex… pf_identity_sex
    ##    <dbl> <chr>     <chr>             <dbl>            <dbl>           <dbl>
    ##  1  2016 Albania   Easte…               10               10              10
    ##  2  2016 Algeria   Middl…                0                0               0
    ##  3  2016 Angola    Sub-S…                0                0               0
    ##  4  2016 Argentina Latin…               10               10              10
    ##  5  2016 Armenia   Cauca…               10               10              10
    ##  6  2016 Australia Ocean…               10               10              10
    ##  7  2016 Austria   Weste…               10               10              10
    ##  8  2016 Azerbaij… Cauca…               10               10              10
    ##  9  2016 Bahamas   Latin…               10               10              10
    ## 10  2016 Bahrain   Middl…               10               10              10
    ## # … with 1,448 more rows, and 1 more variable: ef_legal_gender <dbl>

4)  Select all the variables that:

<!-- end list -->

  - Contain references to \`“tax”

  - Deal with “labor” freedoms

  - Contain references to “identity”

  - Deal with security and safety issues

  - In the first 4 or last 4 columns.

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

<!-- end list -->

``` r
mutate(flights_sml,
       gain = dep_delay - arr_delay, 
       speed = distance / air_time * 60
)
```

    ## # A tibble: 336,776 x 9
    ##     year month   day dep_delay arr_delay distance air_time  gain speed
    ##    <int> <int> <int>     <dbl>     <dbl>    <dbl>    <dbl> <dbl> <dbl>
    ##  1  2013     1     1         2        11     1400      227    -9  370.
    ##  2  2013     1     1         4        20     1416      227   -16  374.
    ##  3  2013     1     1         2        33     1089      160   -31  408.
    ##  4  2013     1     1        -1       -18     1576      183    17  517.
    ##  5  2013     1     1        -6       -25      762      116    19  394.
    ##  6  2013     1     1        -4        12      719      150   -16  288.
    ##  7  2013     1     1        -5        19     1065      158   -24  404.
    ##  8  2013     1     1        -3       -14      229       53    11  259.
    ##  9  2013     1     1        -3        -8      944      140     5  405.
    ## 10  2013     1     1        -2         8      733      138   -10  319.
    ## # … with 336,766 more rows

  - Why not use `arr_delay - dep_delay`?

  - Why multiply by 60 in the speed calculation?

<!-- end list -->

2)  Use `mutate()` to create a logical variable that indicates whether
    or not the flight was delayed in arriving?

3)  What’s the difference between these two commands?

<!-- end list -->

``` r
mutate(flights_sml, air_time_hrs = air_time/60)
```

    ## # A tibble: 336,776 x 8
    ##     year month   day dep_delay arr_delay distance air_time air_time_hrs
    ##    <int> <int> <int>     <dbl>     <dbl>    <dbl>    <dbl>        <dbl>
    ##  1  2013     1     1         2        11     1400      227        3.78 
    ##  2  2013     1     1         4        20     1416      227        3.78 
    ##  3  2013     1     1         2        33     1089      160        2.67 
    ##  4  2013     1     1        -1       -18     1576      183        3.05 
    ##  5  2013     1     1        -6       -25      762      116        1.93 
    ##  6  2013     1     1        -4        12      719      150        2.5  
    ##  7  2013     1     1        -5        19     1065      158        2.63 
    ##  8  2013     1     1        -3       -14      229       53        0.883
    ##  9  2013     1     1        -3        -8      944      140        2.33 
    ## 10  2013     1     1        -2         8      733      138        2.3  
    ## # … with 336,766 more rows

``` r
transmute(flights_sml, air_time_hrs = air_time/60)
```

    ## # A tibble: 336,776 x 1
    ##    air_time_hrs
    ##           <dbl>
    ##  1        3.78 
    ##  2        3.78 
    ##  3        2.67 
    ##  4        3.05 
    ##  5        1.93 
    ##  6        2.5  
    ##  7        2.63 
    ##  8        0.883
    ##  9        2.33 
    ## 10        2.3  
    ## # … with 336,766 more rows

When might you prefer the second over the first?

4)  What is this doing? Explain the `%/%` and `%%` operators.

<!-- end list -->

``` r
transmute(flights, dep_time,
          hour = dep_time %/% 100, 
          minute = dep_time %% 100
)
```

    ## # A tibble: 336,776 x 3
    ##    dep_time  hour minute
    ##       <int> <dbl>  <dbl>
    ##  1      517     5     17
    ##  2      533     5     33
    ##  3      542     5     42
    ##  4      544     5     44
    ##  5      554     5     54
    ##  6      554     5     54
    ##  7      555     5     55
    ##  8      557     5     57
    ##  9      557     5     57
    ## 10      558     5     58
    ## # … with 336,766 more rows

5)  Use the data set `flights_sml2` and modulo arithmetic to convert
    actual departure time to departure time in minutes after midnight.

<!-- end list -->

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
