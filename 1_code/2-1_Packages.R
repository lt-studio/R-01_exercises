# PACKAGES

# There are packages that go with R by default but not always loaded.See the package list in Rstudio next to Plots tab.
# Install pacman ("package manager") if needed
if (!require("pacman")) install.packages("pacman")
# Load contributed packages with pacman
pacman::p_load(pacman, party, psych, rio, tidyverse) # :: means use the command from pacman.
# pacman: for loading/unloading packages
# party: for decision trees
# psych: for many statistical procedures
# rio: for importing data
# tidyverse: for so many reasons

# Packages specialized in plotting like ggplot2 and GGally which is an extension to ggplot2
install.packages(c("ggplot2", "GGally"))

# Load base packages manually
library(GGally)

# Load and prepare data ####

# Use the iris data set which is built-in in R
data(iris)
# Create some nice plots with GGally tools
ggpairs(iris, mapping=ggplot2::aes(colour = Species)) # this gives a lot of information in just a single line code.

# Import CSV files with readr::read_csv() from tidyverse
df <- read_csv("StateData.csv") #data in 0_data
# Import other formats with rio::import() from rio
(df <- import("StateData.xlsx") %>% as_tibble())
# or...
df <- import("StateData.xlsx") %>%
  as_tibble() %>%
  select(state_code, 
         psychRegions,
         instagram:modernDance) %>% 
  mutate(psychRegions = as.factor(psychRegions)) %>%
  rename(y = psychRegions) %>%
  print()

# Filter by category ####

# By using standardized object and variable names, the same code can be reused for different analyses.

# Decision tree using party::ctree
# df[, -1]) excludes the state_code
fit <- ctree(y ~ ., data = df[, -1])  # create tree
fit %>% plot()                        # plot tree
fit %>%                               # predicted vs true
  predict() %>%
  table(df$y)

hc <- df %>%  # get data
  dist %>%    # compute distance/dissimilarity matrix
  hclust %>%  # compute hierarchical clusters
  plot(labels = df$state_code)  # Plot dendrogram

# Clean up ####

# Clear packages
p_unload(all)  # Remove all add-ons
detach("package:datasets", unload = TRUE)  