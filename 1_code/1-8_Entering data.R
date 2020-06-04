# NAVIGATING ####

# Load base packages manually
library(datasets)  # For example datasets

# Load and prepare data
?iris       #what is iris?
df <- iris  #store the data in a data frame
head(df)    #see the first few rows of the data frame

# Plot data
hist(df$Sepal.Width, 
     main = "Histogram of Sepal Width",
     xlab = "Sepal Width (in cm)")

# COMMENT LINES ####

# Use comments to disable commands (Ctrl+Shift+C to switch off comments)
hist(df$Sepal.Width,
     # col  = "#CD0000",  # red3
     # border = NA,  # No borders
     main = "Histogram of Sepal Width",
     xlab = "Sepal Width (in cm)")

# THIS IS A LEVEL 1 HEADER #################################

## This Is a Level 2 Header ================================

### This is a level 3 header. ------------------------------

# headers appear in document outline (Ctrl+Shift+O), but header levels are only indented in Markdown language. 

# ENTERING DATA ####

# Basic commands
2+2    # basic math
1:100  # prints numbers 1 to 100 across several lines
print("Hello World!")  # prints "Hello World" in console

# Create sequential data
0:10     # 0 through 10
10:0     # 10 through 0
seq(10)  # 1 to 10
seq(30, 0, by = -3)  # Count down by 3

# ASSIGNING VALUES ####

# Individual values
a <- 1            # use <- and not = (confused with arguments)
2 -> b            # can go other way, but silly
c <- d <- e <- 3  # multiple assignments

# Multiple values
x <- c(1, 2, 5, 9)  # c = Combine/concatenate
x                   # print contents of x in Console

# MATHS ####
(y <- c(5, 1, 0, 10)) # surround command with () also print
x + y       # Adds corresponding elements in x and y
x * 2       # Multiplies each element in x by 2
2^6         # Powers/exponents
sqrt(64)    # Squareroot
log(100)    # Natural log: base e (2.71828...)
log10(100)  # Base 10 log

# CLEAN UP ####

# Clear environment
rm(list = ls()) 

# Clear packages
detach("package:datasets", unload = TRUE)  # for base

# Clear plots
dev.off()  # but only if there IS a plot

# Clear console
cat("\014")  # ctrl+L