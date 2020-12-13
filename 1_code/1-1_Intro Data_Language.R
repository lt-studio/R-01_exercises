# 1. THE LANGUAGE OF DATA

# 1.1 Datasets and data frames ####

# The dataset "High School and Beyond" comes from a survey which was conducted on high school seniors by the National Center of Education Statistics. 
# The data is organized in a data frame, where each row represents an observation or a case, and each column represents a variable. This data is stored in the openintro package.

# Install, load the package and the data:
install.packages("openintro")
library(openintro)
data(hsb2) # simply load the dataset without doing anything.
# When you first start working with a dataset, it is a good practice to take a note of its dimension, the number of observations (rows), and variables (columns) in the data frame. View the structure of the data with:
str(hsb2)
# Another option for taking a quick look at your data is using glimpse() from the dplyr package.
library(dplyr)
glimpse(hsb2)
# The output of glimpse() is similar to str(), except that glimpse() always tries to show as much of the data as it fits to the screen. 

# 1.2 Types of variables ####

# Variables help us determine:
# What summary statistics to calculate?
# What type of visualization to make?
# What statistical method will be appropriate to answer the research questions?

# There are 2 types of variables: 
# Numerical (quantitative): variables take on numerical values. It is sensible to add, subtract, take averages... with these values. 
# Categorical (qualitative): takes on a limited number of distinct categories. These categories can be identified with numbers, but only as placeholders for the levels of the categorical variable, i.e, it wouldn't be sensible to do arithmetic operations with these values.

# Examine the first variable of the hsb2 dataset, which is an identifier variable for the student:
str(hsb2$id) # strictly speaking, this is a categorical variable, though the labeling is likely not that useful since we would not use this variable in an analysis. It is equivalent to having the names of these students.
# The gender variable is categorical with levels male and female with no inherent ordering. This is called nominal categorical variables.
str(hsb2$gender) 
# Similar to race variable:
str(hsb2$race)
# Socioeconomic status, on the other hand, has 3 levels: low, middle, and high that have an inherent ordering. This is called ordinal categorical variable.
str(hsb2$ses)
# School type and program are also both nominal categorical variables.
str(hsb2$schtyp)
str(hsb2$prog)
# The remaining variables are scores that these students received in reading, writing, math, science, and social studies tests. These are numerical variables.
str(hsb2$read)
# Numerical variables can be further categorized as continuous or discrete. 
# Continuous: infinite number of values within a given range, often measured.
# Discrete: specific set of numeric values that can be counted or enumerated, often counted. 
#Since the scores in the datasets are all whole numbers, and assuming that it is not possible to obtain a non-whole score on the tests, these variable are discrete numerical.

# Load another dataset, email50, which contains a subset of incoming emails for the first 3 months of 2012 for a single email account.
data(email50)
# Identify variable types:
glimpse(email50)
# Variable descriptions are available in the help file for the dataset.
?email50

# 1.3 Categorical data: Factors ####

# Factor is a data class in R that stores categorical variables. An important use of factors is in statistical modeling, since categorical variables enter into models differently than numerical variables. Sometimes factors might be undesirable, but in many places they are essential to run a statistical analysis correctly.

# Subgroup analysis: work only with a subset of data, e.g, analyzing data only from students in public schools. Obtain these subsets by frequency table:
table(hsb2$schtyp)
# Obtain subsets by filtering:
hsb2_public <- hsb2 %>% 
  filter(schtyp == "public")
# Now if we make another frequency table of school type in the subsetted dataset, we should only see public school.
table(hsb2_public$schtyp)
# But since we already filtered out the students from private schools, it is unexpected that the level is still there as an empty placeholder, without observations in it. This is not necessary a problem, but it can result in unexpected behavior and complicate the visualizations. In order to get rid of the unused levels showing up in summaries and graphs, we can explicitly drop them with droplevels function:
hsb2_public$schtyp <- droplevels(hsb2_public$schtyp)
# Run again the frequency table:
table(hsb2_public$schtyp)

# The "number" column in the email50 dataset is a factor variable which tells what type of number (none, small, or big) an email contains. Subset the emails with big numbers:
email50_big <- email50 %>% 
  filter(number == "big")
# Glimpse the subset:
glimpse(email50_big)
# Make a table of the number variable:
table(email50_big$number) # "none" and "small" levels are unused.
# Drop unused levels:
email50_big$number_dropped <- droplevels(email50_big$number)
# Remake the table of number_dropped in the subset:
table(email50_big$number_dropped)

# 1.4 Discretize a variable ####

# A common way of creating a new variable from an existing variable is discretizing that is a numerical variable to a categorical variable based on certain criteria.
# E.g, suppose we are not interested in the actual reading score of students, but instead whether their reading score is below average or at or above average. 
# First we need to calculate the average reading score:
(avg_read <- mean(hsb2$read))
# Next, determine whether each student is below or at or above average:
hsb2 <- hsb2 %>% 
  mutate(read_cat = ifelse (read < avg_read,
                            "below average",
                            "at or above average"))
# See the result with a frequency table:
table(hsb2$read_cat)

# The num_char variable in the email50 dataset is the number of characters in an email, in thousands. Create a categorical version with two levels deciding whether an email has more or less than the median number of characters.
(med_num_char <- median(email50$num_char))
email50_fortitied <- email50 %>%
  mutate(num_char_cat = ifelse(num_char < med_num_char,
                               "below median", 
                               "at or above median"))
# We can also use count() to determine the number of emails in each level of num_char_cat.
email50_fortitied %>%
  count(num_char_cat)

# Another common way of creating a new variable based on an existing one is by combing levels of a categorical variable. E.g, the email50 dataset has a categorical variable called "number" with levels "none", "small", and "big", but suppose we're only interested in whether an email contains a number. 
email50_fortitied <- email50 %>%
  mutate(number_yn = case_when(number == "none" ~ "no",
                               number != "none" ~ "yes"))

# 1.5 Visualizing data ####

# The most logical and most useful first step of any data analysis is an exploratory analysis. And a very important and informative component of exploratory data analysis is visualization. There are many ways of visualizing data in R, but we will use ggplot2 package because this package makes modern looking, hassle-free plots.
library(ggplot2)
# Visualize the distribution of number_yn:
ggplot(email50_fortitied, aes(number_yn)) +
  geom_bar()
# Visualize the relationship between "num_char" (number of characters) and "exclaim_mess" (number of exclamation points), conditioned on whether or not the email was spam.
ggplot(email50, aes(num_char, exclaim_mess,
                    color = factor(spam))) + 
  geom_point()

# Visualize the relationship between the math and science scores in the hsb2 dataset:
ggplot(hsb2, aes(science, math)) + 
  geom_point()
# The scatter plot renders each observation as a point on the plot. We can see that there is a positive relationship between the science and math scores of students.
# ggplot2 plots are constructed imperatively from a series of layers, which makes the code a lot easier to organize and read. We can also extend bivariate to multivariate plots easily in ggplot2, e.g, adding the program factors to the same plot:
ggplot(hsb2, aes(science, math, color = prog)) +
  geom_point()
# The color as an aesthetic mapping layer reveals similar positive relationship, and we can also see that students in academic programs tend to score higher than those in vocational nd general programs.