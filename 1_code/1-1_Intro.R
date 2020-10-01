# INTRODUCTION TO R

# Create a vector object named x with 5 random diviates from a standard normal distribution
x <- rnorm(5) # use "<-" for assignment rather than "=" or "->" to avoid confusion.
# Comments after "#" are ignored by R intepreter.

## The distribution of weights and their relationship to age ###
# Enter age and weight data as vectors using combining function (Tab 1.1)
age <- c(1,3,5,2,11,9,3,9,12,3)
weight <- c(4.4,5.3,7.2,5.2,8.5,7.3,6.0,10.4,10.2,6.1)
# Find out the avarage weight
mean(weight)
# Find out the standart deviation
sd(weight)
# Find out the correlation between age and weight
cor(age, weight) # corellation = 0.91: there is strong linear relationship between age in months and weight in kilograms.
# Plot to visually inspect the trend
plot(age, weight) # not surprisingly, as infants get older, they tend to weigh more.

## See what R can do graphically ####
demo() #a complete list of demonstrations
#try out different types of demonstrations from the package "graphics"
demo(Hershey) 
demo(persp) 
demo(graphics)
demo(image) 

## Getting help (Tab 1.2) ####

help.start() #general help
help() #or ?"function" for specific function
help.search() #search the help system for instances of the function
example() #example of the function
RSiteSearch() #search online help manual
data() #list all available example datasets for currently installed packages.

## Set current options ####
#history(#) #disfunctions for managing working space
getwd() #shows the current working directory
setwd("C:/Documents/R") #changes the current working directory to C:/Documents/R
ls() #lists the objects in current working space
#rm(objectlist) #remove one or more objects
options() #view or set current options
options(digits = 3) #numbers are formatted to print with 3 digits after the decimal place
x <- runif(20) #create a vector with 20 uniform random variates
summary(x) #summary statistics
savehistory("my-file") #saves the commands to my-file
loadhistory("my-file") #reloads a command's history
save.image("my-file") #save the working space to my-file
save(objectlist, file = "my-file") #save specific objects to a file  
load(my-file) #load workspace into the current session
q() #quit R