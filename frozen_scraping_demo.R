# Demo to show the idea of using Selector Gadget to Identify
# relevant css selectors in web page
library(tidyverse)
library(rvest)

frozen_movie <- read_html("http://www.imdb.com/title/tt2294629/")
rating <- frozen_movie %>% 
  html_nodes("strong span") %>%
  html_text() %>%
  as.numeric()
rating

title <- frozen_movie %>% 
  html_nodes("h1") %>%
  html_text() 
title

cast <- frozen_movie %>%
  html_nodes(".primary_photo+ td a") %>%
  html_text()
cast

poster <- frozen_movie %>%
  html_nodes(".poster img") %>%
  html_attr("src")
poster

temp <- frozen_movie %>% 
  html_nodes(".small")%>%
  html_text()

votes <- temp[[2]] %>% 
  parse_number()
votes


