# BOXPLOTS

# Quantitative variables are usually graphed with histograms to see the shape of the distribution or boxplots which are useful for showing outliers.
# Use the dataset "diamonds" that goes with ggplot2 in tidyverse package to do this exercise.

# LOAD DATA #################################################

# pacman must already be installed; then load contributed
# packages (including pacman) with pacman
pacman::p_load(pacman, tidyverse)
# Using the diamonds dataset from ggplot2
?diamonds  # get information about the diamonds dataset
diamonds   # display the beginning of the dataset

# BARPLOT OF FREQUENCIES ####################################

# Create a boxplot with default command in Base R
boxplot(diamonds$price) #overlapping outliers in the dataset.
# Same process with tidyverse
diamonds %>%
  select(price) %>%
  boxplot()
# Add titles and change the size of the box
diamonds %>%
  select(price) %>%
  boxplot(
    main   = "Boxplot of Price of Diamonds",
    sub    = "(Source: ggplot2::diamonds)",
    xlab   = "Price of Diamonds",
    boxwex = 0.4
  )
# Add color and a notch that is the confidence interval for the median
diamonds %>%
  select(price) %>%
  boxplot(
    notch  = TRUE,  #notch is narrow becaus of big dataset.  
    main   = "Boxplot of Price of Diamonds",
    sub    = "(Source: ggplot2::diamonds)",
    xlab   = "Price of Diamonds",
    boxwex = 0.4,
    col    = "#CD0000"  # red3
  )
# Turn to horizontal direction
diamonds %>%
  select(price) %>%
  boxplot(
    horizontal = TRUE,  
    notch  = TRUE,         
    main   = "Boxplot of Price of Diamonds",
    sub    = "(Source: ggplot2::diamonds)",
    xlab   = "Price of Diamonds",
    col    = "#CD0000"  # red3
  )

# BOXPLOTS BY GROUP ########################################

# Boxplots are also useful for comparing several different groups or possibly several different variables as long as they are on the same scale. 
# For this, use the generic command plot()
diamonds %>%
  select(color, price) %>%
  plot()
# Boxplots by group using boxplot()
diamonds %>%
  boxplot(price ~ color,  # tilde indicates formula
    data  = . ,           # dot is placeholder for pipe
    col   = "#CD0000")
# More options
boxplot(price ~ color, data = diamonds, 
        boxwex=0.4 , ylab="Price of Diamonds",
        main = "Boxplot of price and color", 
        col = c("slateblue1" , "tomato", "aquamarine", "bisque", "cyan", "darkolivegreen", "darkorchid1"),  
        xaxt="n") # suppress the default x-axis

        

        