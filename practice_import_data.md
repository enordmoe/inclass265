# Chapter 7: Data Import Practice
Intro to Data Science

Because of the technical nature of this section, we’ll start with some
very simple examples to try to understand the tools and tricks for
correctly importing problematic data. Few datasets will have all the
issues raised in this section but many will have some.

### Reading data from a CSV file

Comma-separated values files are frequently used to share data because
they are text-only and easily imported into any data science software.
To get us started, I have included the `students.csv` file from the text
in the **data** folder of your **inclass265** repository.

First, just read and view the data as is:

``` r
students <- read_csv("data/students.csv")
```

#### Dealing with NA data

View the data and use `spec()` to see the variable types R used. Note
the two different versions of “not available” we see in the data
listing. How does the following address this “problem”?

``` r
students <- read_csv("data/students.csv", na = c("N/A", ""))
```

Use the `na=` argument to specify non-standard or missing NA codes.

#### Dealing with Non-Syntactic Names

The R `read_csv()` function deals with names that violate R variable
naming rules (e.g., start with numbers, contain blanks, etc.) by
preserving the names but adding single tick marks (\`) around them so
they are correct recognized as variable names when used in code. The
`students.csv` data contains examples of these kinds of names.

``` r
# print the dataset using its name and look at column headers
students
```

#### The **janitor** package to the rescue

- The **janitor** package provides powerful tools for examining and
  cleaning dirty data.

- The function `clean_names()` fixes all sorts of problematic variable
  names and puts them in snake_case.

``` r
students <- students |>
  janitor::clean_names() |>
  mutate(
    meal_plan = factor(meal_plan),
    age = parse_number(if_else(age == "five", "5", age))
  )
```

- The mutate functions show how to address other data issues

- The `janitor::clean_names()` notation simply specifies the function
  without loading the entire **janitor** package.

### Using other arguments

Use the R trick shown below to create a toy CVS data file. This is
useful for experimenting with `readr` and for creating reproducible
examples to share with others. For example, running the lines below
creates a **tibble** with 2 rows and 3 columns[^1]:

``` r
read_csv("a,b,c
1,2,3
4,5,6")
```

1.  You can use `skip = n` to skip the first n lines of metadata:

``` r
read_csv("The first line of metadata 
The second line of metadata
x,y,z
1,2,3", skip = 2)
```

Can also ignore all lines preceded by a specified comment character:

``` r
read_csv("# A comment I want to skip
x,y,z
# Another comment
1,2,3", comment = "#")
```

Question: What would have happened if we didn’t specify the comment
character?

2.  If no column names, let R generate them or specify them manually.

``` r
# R generates the names
read_csv("1,2,3\n 4,5,6", col_names = FALSE)
```

**Aside:** Note use of the newline specifier `\n`. These are commonly
encountered in data and also used to format output. For example, the
following

``` r
message <- "Hello\nworld!"
print(message)
```

If you prefer, you can also specify custom variable names using the
`col_names()` function:

``` r
# We specify the names 
read_csv("1,2,3\n4,5,6", col_names = c("x", "y", "z"))
```

3.  Specify `na` values if non-standard NA values used:

``` r
read_csv("a,b,c\n1,2,.", na = ".")
```

Take comfort in these words from Hadley Wickham:

> “These arguments are all you need to know to read the majority of CSV
> files that you’ll encounter in practice. (For the rest, you’ll need to
> carefully inspect your .csv file and read the documentation for
> `read_csv()`’s many other arguments.)”

Also, as noted in the text, once you know `read_csv()`, you can easily
adapt what you’ve learned to the other more specialized `read_xxx()`
functions such as `read_tsv()` for tab-separated files and `read_fwf()`
for “fixed width” files with strict formatting rules. Note that
`read_delim()` is a great option for files with less common delimiters
like, say, `;`, `-`, or even `%`.

Practice Exercises:

P1. What function would you use to read a file where fields were
separated with the vertical line `|`?

P2. Identify what is wrong with each of the following inline CSV files.
What happens when you run the code? (Try to spot the error before
running the command.)

``` r
#(a)
read_csv("a,b\n1,2,3\n4,5,6")
#(b)
read_csv("a,b,c\n1,2\n1,2,3,4") 
#(c)
read_csv("a,b\n\"1") 
#(d)
read_csv("a,b\n1,2\na,b") 
#(e)
read_csv("a;b\n1;3")
```

[^1]: We could create a small text data file with `csv` extension but
    that would lose the advantage of having a simple self-contained
    example.
