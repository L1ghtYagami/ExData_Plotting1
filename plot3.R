# Source the code to load data and change class of Date and Time columns
source("load_and_process_data.R")

# Load in the data
df <- load_data()

# Create Date.Time column in the dataframe
df <- modify_df(df)

# Open the png graphics device
png("plot3.png")

# Plot the graph. Specifying type="n" so that no point gets plotted
plot(df$Date.Time, df$Sub_metering_1, type = "n",
     xlab = "", ylab = "Energy sub metering")
# Add lines without points
lines(df$Date.Time, df$Sub_metering_1, type = "l")
lines(df$Date.Time, df$Sub_metering_2, type = "l", col = "red")
lines(df$Date.Time, df$Sub_metering_3, type = "l", col = "blue")

# Add legend
legend("topright",
       lwd = c("1", "1", "1"),
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close the connection to save the file
dev.off()
