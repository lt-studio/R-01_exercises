# DATA TYPES / VARIABLE TYPES ####

# Integer and Numeric

integer <- 15  # whole number
integer        # double precision by default
typeof(integer)

numeric <- 1.56 #decimal
numeric
typeof(numeric)

# Character

character1 <- "c" #a text, must be in "..."
character1        #also returns in "..."
typeof(character1)

# Logical

logical1 <- TRUE  #letters in all CAPS
logical1
typeof(logical1)

logical2 <- F     #abbr. F and T also work
logical2
typeof(logical2)


# DATA STRUCTURES ####

## Vector ####

vector1 <- c(1, 2, 3, 4, 5)
vector1

vector2 <- c("a", "b", "c")
vector2

vector3 <- c(TRUE, TRUE, FALSE, FALSE, TRUE)
vector3
is.vector(vector3) #check if it's a vector

## Matrix ####

matrix1 <- matrix(c(T, T, F, F, T, F), nrow = 2)
matrix1

matrix2 <- matrix(c("a", "b", "c", "d"), 
               nrow = 2,
               byrow = T)
matrix2
is.matrix(matrix2) #check if it's a matrix

## Array ####

# Give data, then dimensions (rows, columns, tables)
array1 <- array(c( 1:24), c(4, 3, 2))
array1
is.array(array1) #check if it's an array

## Data Frame ####

# Can combine vectors of the same length
vNumeric   <- c(1, 2, 3)
vCharacter <- c("a", "b", "c")
vLogical   <- c(T, F, T)

df1 <- cbind(vNumeric, vCharacter, vLogical)
df1  # coerces all values to most basic data type

df2 <- as.data.frame(cbind(vNumeric, vCharacter, vLogical))
df2  # makes a data frame with three different data types
is.data.frame(df2) #check if it's a data frame

## List ####

object1 <- c(1, 2, 3)
object2 <- c("a", "b", "c", "d")
object3 <- c(T, F, T, T, F)

list1 <- list(object1, object2, object3)
list1 #basically, list can have anything in it

list2 <- list(object1, object2, object3, list1)  # lists within lists!
list2

# COERCING TYPES ####

## Automatic Coercion goes to "least restrictive" data type 
coerce1 <- c(1, "b", TRUE)
typeof(coerce1)

## Coerce Numeric to Integer #### 
coerce2 <- 5
typeof(coerce2)

coerce3 <- as.integer(5)
typeof(coerce3)

## Coerce Character to Numeric ####

coerce4 <- c("1", "2", "3")
typeof(coerce4)

coerce5 <- as.numeric(c("1", "2", "3"))
typeof(coerce5)

## Coerce Matrix to Data Frame  ####

coerce6 <- matrix(1:9, nrow= 3)
is.matrix(coerce6)

coerce7 <- as.data.frame(matrix(1:9, nrow= 3))
is.data.frame(coerce7)