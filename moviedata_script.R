library(tidyverse)
library(rvest)

topmovies<- read_html("https://www.imdb.com/chart/top")

moviedata <-
  tibble(
    title =
      topmovies |>
      html_elements(".with-margin .ipc-title__text") |>
      html_text2(),
    year =
      topmovies |>
      html_elements(".cli-title-metadata-item:nth-child(1)") |>
      html_text2() |>
      parse_number(),
    rating =
      topmovies |>
      html_elements(".ipc-rating-star--rating") |>
      html_text2() |>
      parse_number(),
    votes =
      topmovies |>
      html_elements(".ipc-rating-star--voteCount") |>
      html_text2() |> 
      str_remove_all("[^0-9MK\\.]") |>  # Remove non-numeric characters except M/K/decimal
      tibble(votes = _) |>
      mutate(
        votes = case_when(
          str_detect(votes, "M") ~ parse_number(votes) * 1e6,  # Convert M to millions
          str_detect(votes, "K") ~ parse_number(votes) * 1e3,  # Convert K to thousands
          TRUE ~ parse_number(votes)                           # Just parse normal numbers
        )
      ) |> 
      pull(votes),  # Extract as a numeric vector,
    runtime =
      topmovies |>
      html_elements(".cli-title-metadata-item:nth-child(2)") |>
      html_text2() |> 
    tibble(duration = _) |>   # Convert to tibble for easy manipulation
      mutate(
        hours = parse_number(str_extract(duration, "\\d+h")) * 60,  # Extract hours and convert to minutes
        minutes = parse_number(str_extract(duration, "\\d+m")),     # Extract minutes as a number
        total_minutes = coalesce(hours, 0) + coalesce(minutes, 0)   # Sum hours & minutes, replacing NA with 0
      ) |> 
      pull(total_minutes)  # Extract as a numeric vector
  )

moviedata