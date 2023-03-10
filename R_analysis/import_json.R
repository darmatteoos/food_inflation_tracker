library(purrr)
library(tidyverse)
library(jsonlite)

path <- "./R_formatted_data/data1"
files <- dir(path, pattern = "*.json")

# joining files in a single list (source:
# https://stackoverflow.com/questions/35421870/reading-multiple-json-files-in-a-directory-into-one-data-frame
# )
data <- files %>%
  map_df(~fromJSON(file.path(path, .), flatten = TRUE))

#to convert a list to a tibble, we need to first pass through a df
data <- data.frame(data)
data <- as_tibble(data)

#converting character to posix 
data$date <- as.POSIXct(data$date)
