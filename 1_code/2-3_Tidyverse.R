# TIDYVERSE

# Tidyverse is a especially useful collection of R packages that change the day-to-day functioning of R so significantly, it can be considered a dialect of R. More info at tidyverse.org.
# The name Tidyverse coms from tidy data, that data could be easily imported and manipulated and shared from one program or application to another.

# INSTALL AND LOAD TIDYVERSE#################################

# Install complete Tidyverse
install.packages("tidyverse")

# Core packages in tidyverse:
# ggplot2: grammar of graphics for plotting
# dplyr: data manipulation
# tidyr: help your data tidy
# readr: reading data
# purrr: enhances functional programming
# tibble: a way of storing data within R
# stringr: for manipulating string or character or text data
# forcats: for working with factors

# Additional packages are not automatically loaded each time:
# readxl: for reading .xls files
# haven: for reading SPSS, Stata and SAS data files
# googledrive: interact with files on Google Drive from R
# other data formats...
# Load a specific package manually
library("magrittr")

# PIPING COMMANDS %>% #######################################

# For example, load the built-in datasets in R which loads the UCBAdmission data frame
library("datasets")
# A command to compute the percentage within this table
round(prop.table(margin.table(UCBAdmissions, 3)),2) * 100 # # # rather long and difficult to read.
# Instead use the piping function which comes from the package Magrittr and automatically included in tidyverse
UCBAdmissions %>%
  margin.table(3) %>%
  prop.table %>%
  round(2) %>%
  multiply_by(100) # easier to follow and revise when needed.
# General principle of pipes:
# function(data) in R is written as data %>% function() with pipe
# function(data, argument) in R is written as data %>% function(argument) with pipe
# e.g, function3(function2(function1(data, a), b), c) can be set up this way: 
#data %>%
  #function1(a) %>%
  #fucntion2(b) %>%
  #function3(c)