# Source the code to load data and change class of Date and Time columns
source("load_and_process_data.R")

# Load in the data
df <- load_data()

# Create Date.Time column in the dataframe
df <- modify_df(df)

# Open the png graphics device
png("plot4.png", width = 480, height = 480)

# Set the global parameters
# Number of rows and columns in the graphs
par(mfcol = c(2,2))


# Draw the plots

# Plot 1 - Like in plot2.R but ylab does not have "(kilowatts)"
# Plot the graph. Specifying type="n" so that no point gets plotted
plot(df$Date.Time, df$Global_active_power, type = "n",
     xlab = "", ylab = "Global Active Power")
# Add lines without points
lines(df$Date.Time, df$Global_active_power, type = "l")


# Plot 2 - Like in plot3.R but legend without border
# Plot the graph. Specifying type="n" so that no point gets plotted
plot(df$Date.Time, df$Sub_metering_1, type = "n",
     xlab = "", ylab = "Energy sub metering")
# Add lines without points
lines(df$Date.Time, df$Sub_metering_1, type = "l")
lines(df$Date.Time, df$Sub_metering_2, type = "l", col = "red")
lines(df$Date.Time, df$Sub_metering_3, type = "l", col = "blue")

# Add legend
# Specifying bty="n" to not have a box
legend("topright",
       lwd = c("1", "1", "1"), bty = "n",
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


# Plot 3
# Plot the graph. Specifying type="n" so that no point gets plotted
plot(df$Date.Time, df$Voltage, type = "n",
     xlab = "datetime", ylab = "Voltage")
# Add lines without points
lines(df$Date.Time, df$Voltage, type = "l")


# Plot 4
# Plot the graph. Specifying type="n" so that no point gets plotted
plot(df$Date.Time, df$Global_reactive_power, type = "n",
     xlab = "datetime", ylab = "Global_reactive_power")
# Add lines without points
lines(df$Date.Time, df$Global_reactive_power, type = "l")

# Close the connection to save the file
dev.off()
