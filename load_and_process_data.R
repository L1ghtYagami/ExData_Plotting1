# Load sqldf package
library(sqldf)
library(lubridate)
library(dplyr)

load_data <- function(){
    # Load in dataframe using sqldf where Date is either 1/2/2007 or 2/2/2007
    # (format) checked by opening file
    df <- read.csv.sql("./Data/household_power_consumption.txt",
                       sql = "SELECT * FROM file WHERE Date in ('1/2/2007', '2/2/2007')",
                       sep = ";")
}


modify_df <- function(df) {
    # This function adds a Date.Time column to the dataframe using Date and Time
    # columns
    # Create a new Date-Time column
    df <- df %>%
        mutate(Date.Time = paste(Date, Time)) %>%
        mutate(Date.Time = dmy_hms(Date.Time))

    df
}
