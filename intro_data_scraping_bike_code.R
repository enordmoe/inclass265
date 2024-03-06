bikeParse <- read_html("http://www.bikeraceinfo.com/tdf/tdfstats.html")
str(bikeParse)
bikeNodes <- html_nodes(bikeParse, "table")
bikeNodes
bikedata1 <- html_table(bikeNodes, header = TRUE, fill = TRUE)[[1]]
bikedata1 <- clean_names(bikedata1)
namesdf <- names(bikedata1)
bikedata2 <- html_table(bikeNodes, header = FALSE, fill = TRUE)[[2]]

bikedata <- bind_rows(bikedata1, bikedata2)
str(bikedata) # take a look at the structure



df <- tibble(pop) |> 
  slice(-1) |>  
  clean_names() |> 
  rename(population = population2000estimate) |> 
  mutate(
    rank = parse_number(rank), 
    population = parse_number(population),
    country_territory = str_replace_all(country_territory, "\\[[^]]+\\]", "" )
  )
df