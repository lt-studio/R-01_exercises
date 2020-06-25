# BAR CHARTS 

# The simplest kind of visualization is a bar chart.
# Use the dataset "diamonds" that goes with ggplot2 in tidyverse package to do this exercise.

# LOAD DATA ####

# pacman must already be installed; then load contributed
# packages (including pacman) with pacman
pacman::p_load(pacman, tidyverse)
# Using the diamonds dataset from ggplot2
?diamonds  # get information about the diamonds dataset
diamonds   # display the beginning of the dataset

# BARPLOT OF FREQUENCIES ####

# First option is to use the generic plot option in R, though it does have some limitations
plot(diamonds$cut)
# Similar process using pipes
diamonds %>%
  select(color) %>%
  plot()

# More specific is the barplot command with more options to control the graph
barplot(height = diamonds$clarity) # error: height must be a vector or a matrix.
# Create a frequency vector with table() function
table(diamonds$clarity)  
# Make the barplot again
barplot(height = table(diamonds$clarity))
# Similar process using pipes
diamonds %>%
  select(clarity) %>%
  table() %>%  # put data in appropriate format
  barplot()

# SORTING BAR PLOTS ####

# If the variable is ordinal, it indicates lessor or greater amounts of clarity. But most of the time in bar plots you're dealing with nominal variable. It's useful to make the chart in an increasing or descreasing order. 
# Sort bars by decreasing values (not for ordinal variable)
diamonds %>%
  select(clarity) %>%
  table() %>%
  sort(decreasing = TRUE) %>%  # sort table
  barplot()

# ADD OPTIONS TO PLOT ####

# Add title
diamonds %>%
  select(clarity) %>%
  table() %>%  # put data in appropriate format
  barplot(
    main   = "Clarity of Diamonds",
    sub    = "(Source: ggplot2::diamonds)",
    xlab   = "Clarity of Diamonds",
    ylab   = "Frequency"
  )
# Flip to horizontal bars, esp for long lables
diamonds %>%
  select(clarity) %>%
  table() %>%  # put data in appropriate format
  barplot(
    main   = "Clarity of Diamonds",
    sub    = "(Source: ggplot2::diamonds)",
    horiz  = TRUE,  # draw horizontal bars
    ylab   = "Clarity of Diamonds",  # Flip axis labels
    xlab   = "Frequency",
    xlim   = c(0, 15000),  # limits for X axis
  )
# Change color and remove border line of the bars  
diamonds %>%
  select(clarity) %>%
  table() %>%  # put data in appropriate format
  barplot(
    main   = "Clarity of Diamonds",
    sub    = "(Source: ggplot2::diamonds)",
    horiz  = TRUE,  # draw horizontal bars
    ylab   = "Clarity of Diamonds",  # Flip axis labels
    xlab   = "Frequency",
    xlim   = c(0, 15000),  # limits for X axis
    border = NA,  # no borders on bars
    col    = "#CD0000"  # red3
  ) # prettier-looking chart.

# SIDE-BY-SIDE BARPLOT OF FREQUENCIES ####

# Side-by-side bar charts and frequenceies for more than one categorical value at a time.
# The generic plot() prints it out but doesn't tell what different colors mean.
diamonds %>%
  select(color, clarity) %>%
  plot()
# For this type of bar plots, we'll need to do more steps
# Create table
color_clarity <- diamonds %>%
  select(color, clarity) %>%
  table() %>%
  print()  # show table in Console

# Create stacked bar with legend
color_clarity %>%
  barplot(legend = rownames(.))  # draw plot w/legend

# Or using side-by-side bar
color_clarity %>%
  barplot(
    legend = rownames(.),  # dot is placeholder for pipe
    beside = TRUE  # put bars next to each other
  ) # a good way to of looking at the association between two categorical variables and the frequencies and the vaious combinations they present.