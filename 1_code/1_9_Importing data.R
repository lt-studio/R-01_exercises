# IMPORTING DATA

# Eventually you'll want to use your own data. Creating data from scratch in R is not recommended. The most common way is to prepare it in a spreadsheet and import into R as an csv file.
# If the data is a clean rectangular data frame, it's very easy to import into R. There are several ways of importing data in R, including the built-in medthods in Base R and external packages that make the entire process much easier.

# IMPORT CSV FILES WITH BASE R ####

# Set directory path to .../0_data
State <- read.csv("StateData.csv")
# An important difference is the characters are converted to factors. This could be avoided by setting the argument
State <- read.csv("StateData.csv", stringsAsFactors = FALSE)

# IMPORT CSV FILES WITH PACKAGES ####

# Install pacman ("package manager") if needed
if (!require("pacman")) install.packages("pacman")
# Load contributed packages with pacman
pacman::p_load(pacman, party, rio, tidyverse)

# Import CSV files with readr::read_csv() from tidyverse
State <- read_csv("StateData.csv")

# Import other formats with rio::import() from rio
State <- import("StateData.xlsx") %>% 
  as_tibble()

# or...

State <- import("StateData.xlsx") %>%
  as_tibble() %>%
  select(state_code, 
    psychRegions,
    instagram:modernDance) %>% 
  mutate(psychRegions = as.factor(psychRegions)) %>%
  rename(y = psychRegions) %>%
  print()

# CLEAN UP ####

# Clear environment
rm(list = ls()) 

# Clear packages
p_unload(all)  # remove all add-ons

# Clear console
cat("\014")  # ctrl+L