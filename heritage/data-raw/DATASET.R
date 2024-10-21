## code to prepare `heritage_clean` dataset goes here

library(tidyverse)
library(sf)
library(dplyr)

heritage <- read_sf("data-raw/worldheritagesites.shp")


heritage_clean <- heritage %>%
  select(NAME, LONGITUDE, LATITUDE, COUNTRY, REGION, DATEINSCRI, DANGER, AREAHA, CATFIN)


catfin_mapping <- c(
  "C" = "Cultural",
  "N" = "Natural",
  "C/N" = "Cultural/Natural",
  "CD" = "Cultural",
  "ND" = "Not Designated"
)

heritage_clean <- heritage_clean %>%
  mutate(CATFIN_FULL = recode(CATFIN, !!!catfin_mapping))


usethis::use_data(heritage_clean, overwrite = TRUE)
