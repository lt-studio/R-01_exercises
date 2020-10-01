# TRUE BASICS

# Caculate basic arithmethic
1 + 1 # R calculates and print the result as a numeric value.
# Type text in quote " "
"Hello, world!" # R prints it as a string character, also in " ".

## Variables ####

# A variable allows to store a value or an object in R for later use.
# Assign variable height and weight for a rectangle
height <- 2
width <- 4
area <- height * width 
area 

## Workspace ####

# Workspace is the place where variables and information is stored in R.
# Use the list function to access the object
ls() # all the stored objects are listed. 
# If we try to print a non-existing variable, an error occurs
depth # Error: object 'depth' not found.
# Clean up the workspace with remove function
rm(area) # "area" is removed from object list.
# You can save the script as "Rectangle.R" to re-use later.

## Basic data types ####

# Fundamental data types are also called atomic vector types. Use class function to reveal what type of a value is
class(TRUE) # "logical"
class(NA) # "logical"
class(1) # "numeric"
class(1.5) # "numeric"
# Integer is a special type of numeric. To specify a number is an integer, add the letter "L"
class(1L) # "integer"
class("Hello, world!") # "character"
# You can also use is-dot-functions to see whether variables are actually of a certain type
is.numeric(1) # TRUE
is.numeric(1L) # TRUE
is.integer(2) # FALSE
is.integer(2L) # TRUE
# integers are numeric, but not all numerics are integers.

# Convert data types (coercion) ####
as.numeric(TRUE) # 1
as.numeric(FALSE) # 0
as.character(4) # "4"
as.numeric("4.5") # 4.5
as.integer("4.5") # 4, implies some information loss.
as.integer("Hello, world!") # NA, coercion is not always possible.

# VECTORS ####

# A vector is a sequence of data elements.
# Create a vector using c() function to combine values into a vector.
# E.g, create vectors for a card game
drawn_suits <- c("heart", "spades", "diamonds", "diamonds", "spades")
# Check if it's a vector
is.vector(drawn_suits) # TRUE
# Create a vector of integers to store how many cards of each suit remain after you drew 5 cards
remain <- c(11, 12, 11, 13)
# Printing a vector without name gives not much information. Create another vector for the names
suits <- c("spades", "hearts", "diamonds", "clubs")
names(remain) <- suits
remain # now the suits information is accompanied by the proper labels.
# Another way to create names with one-liner
remain <- c(spades = 11, hearts = 12, diamonds = 11, clubs = 13) # in this case no need for text in quote " "
# Variables with a single number or character are actually vectors with length 1.
# A vector can hold only elements of the same type, which is called "atomic vectors" to differentiate from lists. If you try to build a vector with differenct data types, R will convert automatically all values to the same type.
drawn_ranks <- c(7, 4, "A", 10, "K", 3, 2, "Q")
drawn_ranks 
class(drawn_ranks) # "character"

## Arithmetic vectors ####

# Operations with vectors in R are applied element by element
earnings <- c(50, 100, 30)
# How it would be if you triple the earnings
earnings * 3  
# Now find out your balance
expenses <- c(30, 40, 80)
banks <- earnings - expenses 
# Use sum function to calculate the sum of all its elements
sum(banks)
# You can also use relational operators to know when earnings are higher than expenses
earnings > expenses 

## Subsetting vectors ####

# Subsetting vectors is basically selecting parts of the vector to end up with a new vector, which is a subset of the original vector.
# E.g, select the first element from the vector
remain <- c(spades = 11, hearts = 12, diamonds = 11, clubs = 13)
remain[1] #result is a named vector, too!
# Select with the assigned name
remain["spades"] # same result.
# Select multiple elements and store in a new variable
remain_black <- remain[c(1,4)] 
# How the resulting vector is ordered depends on the order of the indices inside the selection
remain_black <- remain[c(4,1)]
# Subsetting all but some using negative indices.
remain[-1] # select all elements except the first one
remain[-c(1,2)] # select all excep the first and second. 
# This minus operator doesn't work with names
remain[-"spades"] # result is an error.
# Using a logical vector that has the same length to subset
remain[c(FALSE, TRUE, FALSE, TRUE)] # TRUE elements will be selected.
# Logical vector could have shorter length, R repeats the contents of the vector until it has the same length
remain[c(FALSE, TRUE)]
remain[c(FALSE, TRUE, FALSE)]