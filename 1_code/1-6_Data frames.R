# DATA FRAMES ####

# Create Ddata Frame ====

# R is a statistical programming language, and in statistics you'll often work with data sets. Such data sets are typically comprised of observations, and some variables associated with them.
name <- c("Anne", "Pete", "Frank", "Julia", "Cath")
age <- c(28, 30, 21, 39, 35)
child <- c(FALSE, TRUE, TRUE, FALSE, TRUE)
df <- data.frame(name, age, child)
df #the data.frame() function inferred the names of the columns from the variable names you passed it.
# To specify the names explicitly, use names() function
names(df) <- c("Name", "Age", "Child")
# Or using one-liner
df <- data.frame(Name = name, Age = age, Child = child)

# Data Frame Structure ====

# Use str() function to see the structure of the data frame
str(df)
# The structur looks similar to a list. That is because data frame is actually a list. But it requires the length of the vectors have to be the same.
data.frame(name[-1], age, child) #error
# By default, R stores in data frames string as factors. To suppress this behaviour, set the stringAsFactor argument
df <- data.frame(name, age, child, stringAsFactor = FALSE)

# Subset Data Frame ====

# To subset a data frame, you can use syntax from both matrices and lists: sing [], double [[]] and $ sign.
people <- data.frame(name, age, child, 
                     stringsAsFactors = FALSE)
people[3,2] #select age of Frank
# You can also use the column to refer to the columns
people[3, "age"]
# Just as for matrices, omitting one of the 2 indices will return an entire row or column respectively.
people[3,] #all available information about Frank
people[,"age"] #result is a vector, because columns contain elements of the same type.
# Subset the data frame to end up with a sub data frame that contains multiple observations
people[c(3, 5), c("age", "child")] #result is a data frame.

# Extend Data Frame ====

# Add new columns = add new variables
height <- c(163, 177, 163, 162, 157)
people$height <- height
people[["height"]] <- height
# Or using cbind() function like in matrices
weight <- c(74, 63, 68, 55, 56)
cbind(people, weight)
# Add new rows = add new observations
tom <- data.frame("Tom", 37, FALSE, 183)
rbind(people, tom) #error, names do not match.
# Specify the names to merge succesful
tom <- data.frame(name = "Tom", age = 37,
                  child = FALSE, height = 183)
rbind(people, tom) #the data frame has 6 obseravations now.

# Sorting ====

# There're also ways to reorder the observations in the data frame to get more insight in the data. Suppose you want to sort the data frame by age
sort(people$age) #an ordered version of the age column, but not a clear way how to use these values.
# Use the order() function instead
ranks <- order(people$age) #returns a vector with the ranked position of each element.
people[ranks,] #results an ordered data frame.
# To sort in descending order, set the decreaseing argument 
people[order(people$age, decreasing = TRUE),]

