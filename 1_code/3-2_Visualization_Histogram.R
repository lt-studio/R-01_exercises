# HISTOGRAMS

# Histograms are most common for visualizing a quantitative variable, that is a measured or scaled, or sometimes called a continuous variable.
# Use the dataset "diamonds" that goes with ggplot2 in tidyverse package to do this exercise.

# LOAD DATA ####

# pacman must already be installed; then load contributed
# packages (including pacman) with pacman
pacman::p_load(pacman, tidyverse)
# Using the diamonds dataset from ggplot2
?diamonds  # get information about the diamonds dataset
diamonds   # display the beginning of the dataset

# HISTOGRAM IN BASE R ####

# Basic histogram
hist(diamonds$price) # default graph
# Change number of bars in the histogram with breaks
hist(diamonds$price, breaks = 7)
# Add titles
hist(diamonds$price,
     breaks = 7,  # Suggest number of breaks
     main   = "Histogram of Price of Diamonds",
     sub    = "(Source: ggplot2::diamonds)",
     ylab   = "Frequency",
     xlab   = "Price of Diamonds"
)
# Change color and remove bars' border
hist(diamonds$price,
     breaks = 7,  # Suggest number of breaks
     main   = "Histogram of Price of Diamonds",
     sub    = "(Source: ggplot2::diamonds)",
     ylab   = "Frequency",
     xlab   = "Price of Diamonds",
     border = NA,  # No borders on bars
     col    = "#CD0000"  # red3
)

# HISTOGRAM WITH GGPLOT2####

# Histograms could be created much efficiently with ggplot2 package that is loaded with tidyverse
ggplot(diamonds, aes(x = price)) +
  geom_histogram() # histograms only use the x aesthetics.
# Control the bin size with binwidth
ggplot(diamonds, aes(x = price)) +
  geom_histogram(binwidth = 100)
# In ggplot2 there're more options to control colors
ggplot(diamonds, aes(x = price)) +
  geom_histogram(fill="white",  # filling color
                 col="red",     # border color
                 alpha=0.5)     # transparency
# Add title
ggplot(diamonds, aes(x = price)) +
  geom_histogram(fill="white",  # filling color
                 col="red",     # border color
                 alpha=0.5) +   # transparency
  ggtitle("Price of diamonds") 