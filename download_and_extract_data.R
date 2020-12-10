download_and_extract_data <- function() {
    # This funtion downloads and extracts the data if it is not downloaded and/or
    # not extracted.

    # Check if Data directory exists. If it does not, create it
    if (!dir.exists("./Data")) {
        dir.create("Data")
    }

    # Check if Dataset.zip file exists or not. If it does not, download it.
    if (!file.exists("./Data/exdata_data_household_power_consumption.zip")) {
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                      "./Data/exdata_data_household_power_consumption.zip",
                      method = "curl")
    }

    # Check if the content of Dataset.zip is extracted or not. If they are not,
    # unzip and extract them inside Data directory
    if (!file.exists("./Data/household_power_consumption.txt")) {
        unzip("./Data/exdata_data_household_power_consumption.zip",
              exdir = "./Data")
    }
}
