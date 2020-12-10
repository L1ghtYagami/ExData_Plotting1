# Source the code to load data and change class of Date and Time columns
source("load_and_process_data.R")

# Load in the data
df <- load_data()

# Create Date.Time column in the dataframe
df <- modify_df(df)

# Open the png graphics device
png("plot2.png", width = 480, height = 480)

# Plot the graph. Specifying type="n" so that no point gets plotted
plot(df$Date.Time, df$Global_active_power, type = "n",
     xlab = "", ylab = "Global Active Power (kilowatts)")
# Add lines without points
lines(df$Date.Time, df$Global_active_power, type = "l")

# Close the connection to save the file
dev.off()
