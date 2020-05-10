# INSTALL AND LOAD PACKAGES #################################

# There are packages that go with R by default but not always loaded. See the package list in Rstudio nex to Plots tab.
# Install pacman ("package manager") if needed
if (!require("pacman")) install.packages("pacman")
# Load contributed packages with pacman
pacman::p_load(pacman, party, psych, rio, tidyverse) #:: means use the command from pacman.
# pacman: for loading/unloading packages
# party: for decision trees
# psych: for many statistical procedures
# rio: for importing data
# tidyverse: for so many reasons

# Load base packages manually, for example datasets
library(datasets)  

# LOAD AND PREPARE DATA #####################################

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

# FILTER BY CATEGORY #######################################

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

# CLEAN UP #################################################

# Clear packages
p_unload(all)  # Remove all add-ons
detach("package:datasets", unload = TRUE)  