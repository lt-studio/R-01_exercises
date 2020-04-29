# MATRICES ####

## Create matrices ====

# A matrix is a two-dimensional array of data elements, arranged in into a fixed number of rows and columns. 
# Use the matrix() function to create a matrix
matrix(1:6, nrow = 2) #nrow defines number of row
matrix(1:6, ncol = 3) #ncol defines number of column
# By default, matrix is filled column by column. Change it into a row-wise fashion
matrix(1:6, nrow = 2, byrow = TRUE) #byrow = FALSE by default.
# When you pass the matrix function a vector that is too short to fill up the entire matrix, R does that automatically, simply repeating the vector
matrix(1:3, nrow = 2, ncol = 3)
# But if you try to fill up the matrix with a vector whose multiple does not nicely fit in the matrix, R generates a warning message
matrix(1:4, nrow = 2, ncol = 3)
# Another easy and intuitive way to create matrices is using rbind() and cbind() function
cbind(1:3, 1:3) #sticks vectors together as columns of the matrix.
rbind(1:3, 1:3) #takes the input as rows and makes a matrix out of them.
# cbind() and rbind() are common and easier to use than matrix()
m <- matrix(1:6, byrow = TRUE, nrow = 2)
# Add one more row in the matrix
rbind(m, 7:9)
# Add one more column in the matrix
cbind(m, c(10, 11))

## Naming matrices ====

# Use rownames() and colnames() functions to assign names to bothe columns and rows in a matrix
rownames(m) <- c("row1", "row2")
colnames(m) <- c("col1", "col2", "col3")
m #names are printed, too.
# One-liner way of naming matrices while building it
m <- matrix(1:6, byrow = TRUE, nrow = 2,
            dimnames = list(c("row1", "row2"), 
                            c("col1", "col2", "col3")))
m #prints out the same result.
# A matrix can contain only one atomic vector type. This means if you try to store different types in a matrix, coercion automatically takes place
num <- matrix(1:8, ncol = 2)
char <- matrix(LETTERS[1:6], nrow = 4, ncol = 3)
cbind(num, char) #the numeric matrix elements were coerced to characters to end up with a matrix that is only comprised of characters.

## Subsetting Matrices ====

# You can also use [] to select single elements from the matrix. But since matrices are like an extension of vectors, it's a bit more complicated dealing with two dimensions.
m <- matrix(sample(1:15, 12), nrow = 3)
# Specify both row and colum in []
m[1,3] #[row, column]
# Subset the entire row or column with syntax [,col] [row,]
m[3,] #select the entire 3th row.
m[,2] #select the entire 2nd column.
# When you pass a single index to subset a matrix, R simply goes through the matrix column by column from left to right
m[4] #in this case, first row, 2nd column.
# Subset multiple elements using c()
m[2, c(2,3)] #2nd row, 2nd and 3rd column.
# Subset by name
rownames(m) <- c("r1", "r2", "r3")
colnames(m) <- c("a", "b", "c", "d")
m["r2", "c"] #works exactly like by index, just replace the indices with corresponding names.
# You can also use the combination of both
m[2, "c"] #names have to be in quote ""
# Subset with logical vector
m[c(FALSE, FALSE, TRUE), c(FALSE, FALSE, TRUE, TRUE)]

## Matrix Arithmetic ====

# Use colSums() and rowSums() functions to take the sum of each column or row.
# E.g, buid a matrix of box office revenue for both US and non-US regions
the_fellowship <- c(316, 556)
two_towers <- c(343, 584)
return_king <- c(378, 742)
lotr_matrix <- rbind(the_fellowship, two_towers, return_king)
colnames(lotr_matrix) <- c("US", "non-US")
rownames(lotr_matrix) <- c("Fellowship", "Two Towers", "Return King")
lotr_matrix #prints the matrix
# The numbers are in million US dollars. To convert it into euros, apply the rate
lotr_matrix/1.12 #the matrix is in euros now
# Suppose the theaters world-wide claim 50 million $
lotr_matrix - 50 #each element minus 50
# Suppose that instead of demanding for the same sum of money for every release, theaters world-wide ask for 50 million for the first release, 80 million for the second and 100 million for the thrid. This could be built in another matrix
theater_cut <- matrix(c(50, 80, 100, 50, 80, 100), nrow = 3)
lotr_matrix - theater_cut #the subtraction is performed element-wise.
# It works the same with a vector
lotr_matrix - c(50, 80, 100) #R performs recycling.
# Matrix multiplication
rates <- matrix(c(1.11, 0.99, 0.82, 1.11, 0.99, 0.82), nrow = 3)
lotr_matrix * rates