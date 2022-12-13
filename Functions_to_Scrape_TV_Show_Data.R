## Here are a few of the functions from the slides to 
## get you started scraping top TV shows
## Places where you need to complete functions are commented out.

## Load Libraries
library(tidyverse)
library(rvest)


wanda <- read_html("http://www.imdb.com/title/tt9140560/")
## sinner <- read_html("----------")
## behind <- read_html("-----------")


wanda_episode <- wanda %>%
  html_nodes(".np_right_arrow .bp_sub_heading") %>%
  html_text() %>%
  str_replace(" episodes", "") %>%
  parse_number()

## ------------------------------------------------------------------------
##
## Create the scrape_episode() function
##
## ------------------------------------------------------------------------

# scrape_episode <- ------(x){
#   x %>%
#     html_nodes(".np_right_arrow .bp_sub_heading") %>%
#     html_text() %>%
#     str_replace(" episodes", "") %>%
#     parse_number()
# }


## ------------------------------------------------------------------------
##
## Create the scrape_show_info() function
## Uncomment to run
##
## ------------------------------------------------------------------------

# scrape_show_info <- function(x){
# 
#   title <- x %>%
#     html_node("#title-overview-widget h1") %>%
#     html_text() %>%
#     str_trim()
# 
#   runtime <- x %>%
#     html_node("#titleDetails time") %>%
#     html_text() %>%
#     str_replace("\\n", "") %>%
#     str_replace("min", "") %>%
#     str_trim()
#   
#   genres <- x %>%
#     html_nodes(".see-more.canwrap~ .canwrap a") %>%
#     html_text() %>%
#     str_trim() %>%
#     paste(collapse = ", ")
#   
#   tibble(title = ------, runtime = -----, genres = ------)
# }



## ------------------------------------------------------------------------
wanda_url <- "https://www.imdb.com/title/tt9140560/"
## sinner_url <- "-----------------"
## behind_url <- "_________________"


## ------------------------------------------------------------------------
# urls <- read_html("INSERT THE URL HERE") %>%
#   html_nodes(".titleColumn a") %>%
#   html_attr("href") %>%
#   paste("http://www.imdb.com", ., sep = "") %>%
#   str_extract(".*tt[0-9]{7,8}")  
#head(urls)
##
## Using the function to scrape shows one by one?
## This could get a bit much!
##
scrape_show_info(urls[1])
scrape_show_info(urls[2])
scrape_show_info(urls[3])

##
## Embrace FP!
## Use mapping to automate!
##

 # top_100_shows <- ----(----, scrape_show_info)
 # top_100_shows

## 
## See note about error message you may get from contacting website too often
## add a pause command using `Sys.sleep()`
##
## scrape_show_info <- function(x){
##   Sys.sleep(runif(1))
##   ...
## 
## }

