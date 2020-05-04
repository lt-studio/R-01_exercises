# LISTS ####

# Create and name List ====

# A list can contain all kinds of R objects, such as vectors and matrices, but also other R objects, such as dates, data frames, factors and many more. 
# Create a list for new songs and relevant details
c("Rsome time", 190, 5) #song name, duration, song track
# trying to store this information in a vector using c() inevitably leads to coercion. Use list() instead
song <- list("Rsome time", 190, 5) #all the elements kept their original type.
# Assign labels with names() function to make it clear
names(song) <- c("tittle", "duration", "track")
# The print looks much nicer!
song
# Use the one-liner way, a bit bulky
song <- list(title = "Rsome time",
             duration = 190,
             track = 5)
# Check if the variable is a list
is.list(song) #TRUE
# Use str() function to display the compact structure of a list
str(song)

# List in list ====

# Suppose you want to add a list containing the title and duration of a similar but less catchy song
similar_song <- list(title = "R you on time?",
                     duration = 230)
# Create the song list again
song <- list(title = "Rsome time", 
             duration = 190, track = 5,
             similar = similar_song)
# Check the list structure again
str(song)

# Subset and Extend Lists ====

# Creating a list is similar like creating a vector. But subsetting lists is quite different. Using single [] for subsetting list will return a list!
song[1] #$title "Rsome time"
# If you want to select the actual string, use double [[]]
song[[1]] #"Rsome time"
# c() function can't be used inside [] to subset multiple elements in lists
song[[c(1,3)]] #error
# Command is actually equivalent to this one
song[[1][3]] #error
# This command means: take the first element from the song list, and from that list, take the third element. But the first element from the song list is simply a character vector of length 1, so there's no way to select the third element from it.

# Subsetting by name is much more straightforward
song["duration"] #190
# Subsetting by logicals is only possible for the single []
song[c(FALSE, TRUE, TRUE, FALSE)] #return 2 lists 
# This doesn't work
song[[c(FALSE, TRUE, TRUE, FALSE)]] #error bcs R interprets this command as:
song[[F][T][T][F]] #makes no sense

# Another way for subsetting is using the $ sign and extending
song$duration #190
# You decide to add a vector of friend names to the song list to remember which ones you've sent to.
friends <- c("Kurt", "Florence", "Patti", "Dave")
# To add this information to the list
song$sent <- friends
# Check the list again
str(song) #there's a 5th element "sent" in the list now
# The same result could be reached using double [[]]
song[["sent"]] <- friends
# To add a reason why you remove the similar song from the list, you could write like this
song$similar$reason <- "too long"
song
