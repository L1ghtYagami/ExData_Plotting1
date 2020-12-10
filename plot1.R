# Source the code to load data and change class of Date and Time columns
source("load_and_process_data.R")

# Load in the data
df <- load_data()

# Open the png graphics device
png("plot1.png", width = 480, height = 480)

# Plot the graph
hist(df$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# Close the connection to save the file
dev.off()
