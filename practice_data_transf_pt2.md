# Data Transformation Part 2 Practice
Intro to Data Science
2024-01-19

- [Working with Columns](#working-with-columns)
  - [Human Freedom Index Data
    examples](#human-freedom-index-data-examples)
  - [More **flights** data examples](#more-flights-data-examples)

# Working with Columns

## Human Freedom Index Data examples

Use `View(hfi_data)` to browse the data and refer to [this Kaggle
link](https://www.kaggle.com/gsutters/the-human-freedom-index) for
background information.

1)  Select variables by name:

``` r
# select certain variables by name
hfi_data |> 
  select(year, countries, region, pf_score, ef_score, hf_score)
hfi_data |> 
  select(year:region)

# By column number : NOT recommended in general b/c of reproducibility problems
hfi_data |> 
  select(1:4)

# select all columns except those between year and day
hfi_data |> 
  select(-(year:region))
```

2)  Use `relocate()` to reorder

``` r
# use relocate to put variables of most interest in first columns
hfi_data |> 
  relocate(year, countries, region, pf_score, ef_score,
           hf_score)

# rename() keeps all variables not explicitly mentioned 
hfi_data |> 
  rename(country = countries)
```

3)  Use the `select()` helper functions to pick variables or groups of
    variables with similar names or distinguishing strings:

<!-- -->

1)  Select key variables and all personal freedom variables:

``` r
hfi_data |> 
  select(year, countries, region, starts_with("pf"))
```

2)  Select all rank variables

``` r
hfi_data |> 
  select(year, countries, region, ends_with("rank"))
```

3)  Select all regulation variables

``` r
hfi_data |> 
  select(year, countries, region, contains("regulation"))
```

4)  Select all regulation variables

``` r
# Select all gender- or sex-related variables
hfi_data |> 
  select(year, countries, region, contains("sex"),
         contains("gender"))
```

4)  For more practice, try to select all the variables that meet each of
    the following criteria:

- Contain references to \`“tax”  

<!-- -->

- Deal with “labor” freedoms  

<!-- -->

- Contain references to “identity”  

<!-- -->

- Deal with security and safety issues

<!-- -->

- Are in the first 4 or last 2 columns. (Hint: There are many
  approaches. One is to use the `last_col()` selection helper.)

## More **flights** data examples

Because most of the variables in the `hfi_data` dataset are recorded on
a 10-point scale, they don’t lend themselves to much in the way of
transformation. Instead, we return to the `flights` data to illustrate
various ways of creating new variables.

We first create a smaller data set of make it easier to see what’s going
on:

``` r
flights_sml <- flights |> 
  select(year:day, ends_with("delay"), distance, air_time, dep_time)
```

Use `flights_sml` for the following `mutate()` examples:

1)  Create two new variables:

``` r
flights_sml |> 
  mutate(
    gain = dep_delay - arr_delay,
    speed = distance / air_time * 60
)
```

- Why not use `arr_delay - dep_delay`?

- Why multiply by 60 in the speed calculation?

2)  What is the following chunk doing? What kind of variable is `late`?

``` r
flights |> 
  mutate(late = arr_delay>0) |> 
  select(year, month, day, carrier, dest, late, arr_delay)
```

3)  What’s the difference between these two commands?

``` r
flights |> 
  mutate(air_time_hrs = air_time/60)
flights |> 
  mutate( air_time_hrs = air_time/60, .keep = "none")
```

When might you prefer the second over the first?

4)  What is this doing? Can you figure out what the `%/%` and `%%`
    operators do?

``` r
flights_sml |> 
  mutate(hour = dep_time %/% 100, 
         minute = dep_time %% 100,
         .keep = "used"
)
```
