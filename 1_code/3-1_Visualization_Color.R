# USING COLOR IN DATA VISUALIZATION

# Create a simple sample data
x <- c(24, 13, 7, 5, 3, 2)  
# Make a default barplot of those number
barplot(x) # basic graph with gray bars and no labels.

# COLORS IN R ####

# Color names R has 657 color names for 502 unique colors,
# Get list of color names
colors() # arranged alphabetically except for white.

# R allows you to specify colors for your output in multiple ways, all of which follow the “col” command.
# For example, all five of these methods refer to the same shade of red:
# Color name: col = "red3"
# Hex code: col = "#CD0000"
# RGB (0-255): col = rgb(205, 0, 0, max = 255)
# RGB (0.00-1.00): col = rgb(.80, .00, .00)
# Index number: col = colors() [555]

# USE COLORS ####

# Check RColorCodes.pdf for a full color chart in 3_resources
# Assign color by color names
barplot(x, col = "red3")  
barplot(x, col = "slategray3")  
# Assign color by RGB triplets (0.00-1.00)
barplot(x, col = rgb(.80, 0, 0))      # red3
barplot(x, col = rgb(.62, .71, .80))  # slategray3
# In programming, it's more common with RGB triplets (0-255)
barplot(x, col = rgb(205, 0, 0, max = 255))     # red3
barplot(x, col = rgb(159, 182, 205, max = 255)) # slategray3
# RGB hexcodes
barplot(x, col = "#CD0000")  # red3
barplot(x, col = "#9FB6CD")  # slategray3
# Or using index numbers in R
barplot(x, col = colors() [555])  # red3
barplot(x, col = colors() [602])  # slategray3

# MULTIPLE COLORS ####

# Use a vector to specify several colors, which will repeat
barplot(x, col = c("red3", "slategray3"))
barplot(x, col = c("#9FB6CD", "#CD0000"))

# USING COLOR PALETTES ####

# See current palette
palette() # 
# Check out some buil-in color palettes in R
barplot(x, col = 1:6)                # Use current palette
barplot(x, col = rainbow(6))         # Rainbow colors
barplot(x, col = heat.colors(6))     # Yellow through red
barplot(x, col = terrain.colors(6))  # Gray through green
barplot(x, col = topo.colors(6))     # Purple through tan
barplot(x, col = cm.colors(6))       # Pinks and blues