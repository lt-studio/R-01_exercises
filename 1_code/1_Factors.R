# FACTORS ####

## Categorical variables ====

# Unlike numerical variables, categorical variables can only take a limited number of different values. As R is a statistical programming language,it has a specific data structure for categorical variables: factors.
# A good examaple of categorical variables is a person's blood type: A, B, AB, O
blood <- c("B", "AB", "O", "A", "O", "A", "B")
# Use factor() function to convert the vector to a factor
blood_factor <- factor(blood)
blood_factor #letters print out without quote " ", and the factor levels, corresponding to the different categories, are printed in alphebetical order.
# R basically does 2 things with factor(): scanning through the vector to see the different categories, then converts the character vector to a vector of integer values. These integers correspond to a set of character values to use when the factor is displayed.
str(blood_factor) #we're dealing with a factor with 4 levels.

## Order levels ====

# Order levels differently by specifying the levels argument in factor() function
blood_factor2 <- factor(blood, levels = c("O", "A", "B", "AB"))
str(blood_factor2) #the encoding is now different.
# You can also specify the level names mannually
levels(blood_factor) <- c("BT_A", "BT_AB", "BT_B", "BT_O")
# You can also specify the category names, or levels, by specify the labels argument 
factor(blood, labels = c("BT_A", "BT_AB", "BT_B", "BT_O"))
# Or using a combination of levels and labels
factor(blood,
       levels = c("O", "A", "B", "AB"),
       labels = c("BT_O", "BT_A", "BT_B", "BT_AB"))

## Nominal vs. Ordinal ====

# Nominal categorical variable has no implied order. E.g, you can't say the blood type O is greater or less than A
blood_factor[1] < blood_factor[2] #NA
# Ordinal categorical variable has a natural order. Consider e.g the code for T-shirt sizes range from small to large. To impose this order on a factor, set the argument "ordered = TRUE", and specify the levels in ascending order
tshirt <- c("M", "L", "S", "S", "L", "M", "L", "M")
tshirt_factor <- factor(tshirt, ordered = TRUE, levels = c("S", "M", "L"))
tshirt_factor #Levels: S < M < L
tshirt_factor[1] < tshirt_factor[2] #TRUE
