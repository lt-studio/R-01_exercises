# SAMPLE DATASETS 

# A good way to get a good feel for what it's like to work in R is to use them with the built-in sample datasets in R.

# Install and load packages ####

# Load base packages manually
library(datasets) 
# Inquire more information about the dataset
?datasets # extra infos are shown in Help window
# For a complete list of data sets
library(help = "datasets")

# Common Data sets ####

# iris data: a great data set for learning about classification and clustering techniques.
?iris # description of iris flowers
iris  # see the entire data set.
# Load and view the data set in table
data(iris)
View(iris)
# Find out how many species are there in the data set
unique(iris$Species)

# UCBAdmissions: a data set to learn how to work with tablular data.
?UCBAdmissions # refers to student admission at UC Berkeley
UCBAdmissions # this is a well-known data set because it helps illustrate a statistical conundrum about what happens when you aggregate different levels of data.

# Titanic: common data set used for machine learning
?Titanic  # who survived the sinking of the Titanic
Titanic   
# from that you can start modeling some of the elements that tried to predict what the outcomes were in that particular situation.

# state.x77: old data of the states in the US 
?state.x77 
state.x77 # get used with demographic information: population, income, life expectancy...etc.

# swiss: data of historic interest in Switzerland 
?swiss
swiss # it's still good to predict, e.g, the rate of infant mortality for each of the cantons in Switzerland in 19th century.