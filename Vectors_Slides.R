##
## Chapter 20 Vectors: R Code from Slides
##
##-----------------------------------------

## ----packages, echo=FALSE, message=FALSE, warning=FALSE------------------
library(tidyverse)
library(rvest)

##
## Slide 3/32
##

# sales <- list(
#     jan = c(9, 2, 10),
#     feb = c(19, 13, 11))
#
# x <- vector("double", 2)
# for (i ____ seq_along(sales)) {
#     x[i] <- mean(sales[[i]])
# }
# x

##
## Slide 4/32
##

# x <- c(13, 12, 14, 15)
#
# ---- (i in x) {
#     if(i %% 2 == 0) {
#         print(paste(i, "is an even number"))
#     } else {
#         print(paste(i, "is an odd number"))
#     }
# }

##
## Slide 5/32
##



# score <- 94
# _____ (score > 70) {
#     print("pass!")
# } else {
#     print("fail")
# }


##
## Slide 6/32
##

# day <- "sat"
# ____ (day == "sat") {
#     print("It is Saturday!")
# }

##
## Slide 7/32
##

# x <- 2
#
# add <- function() {
#     x + 1
# }
#
# x1 <- add()
# x2 <- add()
#
# c(x1, x2)


##
## Slide 12/32
##

# logical vectors are simplest - only 3 values (T, F, NA)
1:10 %% 3 == 0   # `%%` = mod / divisible by
c(TRUE, TRUE, FALSE, NA)

# numeric vectors = double + integer
typeof(1)
typeof(1L)

# note that all doubles are approximations because of floating point
x <- sqrt(2) ^ 2
x
x - 2
sqrt(2)^2 == 2
near(2, sqrt(2)^2)


##
## Slide 13/32
##

# doubles have 4 special values (e.g. NaN = Not a Number)
c(-1, 0, 1, NA) / 0
# check with helper functions and not ==
is.na(c(-1, 0, 1, NA) / 0)

##
## Slide 14/32
##

x <- "This is a reasonably long string."
pryr::object_size(x)
y <- rep(x, 1000)
pryr::object_size(y)
# y doesn't take 1000 times memory of x because each element of y is just
#   a pointer to the same string - pointers take less space

##
## Slide 15/32
##

is_character(c(1, 2, 3, 4, 5))
is_character(c(1, 2, 3, 4, "5"))
is_character(c(1, 2, 3, 4, NA))
is_character(c(1, 2, 3, 4, NA_character_))
is_logical(c(T, T, F))
is_logical(c(TRUE, F, FALSE))
is_logical(c("true", "false", "true"))

##
## Slide 18/32
##

# implicit coercion from logical to numeric - T to 1 and F to 0
x <- runif(1000)
y <- x > .75
sum(y)  # how many are greater than 0.5?
mean(y) # what proportion are greater than 0.5?


##
## Slide 19/32
##

# if multiple types, most complex type wins - cannot mix types in a vector
typeof(c(TRUE, 1L))
typeof(c(1L, 1.5))
typeof(c(1.5, "a"))
is_numeric(typeof(c(1.5, "a"))) 
is_double(typeof(c(1.5, "a")))
is_integer(typeof(c(1.5, "a")))
is_character(typeof(c(1.5, "a")))


##
## Slide 21/32
##

# Stats calculations are simplified by recycling scalars
x<- sample(70:100, 5, replace = TRUE)
x
x - mean(x)
#   tidyverse gives errors if recycle anything but a scalar, since can be dangerous
1:10 + 1:2
1:10 + 1:3  # this will produce a warning
tibble(x = 1:4, y = 1:2) # this will produce an error
tibble(x = 1:4, y = rep(1:2, 2))
tibble(x = 1:4, y = rep(1:2, each = 2))


##
## Slide 22/32
##

##  1. can subset a vector using a numeric vector containing only integers
## #    where negatives indicate drops
x <- c("one", "two", "three", "four", "five")
x[c(3, 2, 5)]
x[c(1, 1, 5, 5, 5, 2)]
x[c(-1, -3, -5)]
x[c(1, -1)]  # this gives an error - can't mix pos and neg

# 2. can also subset with a logical vector
x <- c(10, 3, NA, 5, 8, 1, NA)
x[!is.na(x)]
x[x %% 2 == 0]   # get evens and missings


##
## Slide 23/32
##

# 3. Subsetting with names
x <- c(abc = 1, def = 2, xyz = 5)
x[c("xyz", "def")]

# 4. can also get first row of matrix with x[1,] and first column with x[,1]
temp <- tibble(x = 1:4, y = rep(1:2, each = 2))
temp[1,]
temp[,1]
temp[-1,]

##
## Slide 26/32
##

str(mtcars)
typeof(mtcars)
attributes(mtcars)
attr(mtcars, "class")

##
## Slide 27/32
##

g <- ggplot(mtcars) +
  geom_point(aes(x = wt, y = mpg))
g
typeof(g)
str(g)
attributes(g)

##
## Slide 28/32
##

g[1]
g[[1]]
g$data
g[[1]][1]
g[[1]][[1]]
g[[1]][1,]
g[[1]][,1]
g$data$mpg
g[2]
g[9]
g[9]$labels$x
g$labels$x

##
## Slide 29/32
##

# Following creates a list of regression results in lsq_mod
lsq_mod <- lm(mpg~wt, data = mtcars)
str(lsq_mod)
attributes(lsq_mod)
lsq_mod$coefficients
lsq_mod$call

##
## Slide 32/32
##

methods(summary)
methods(print)
methods(residuals)

