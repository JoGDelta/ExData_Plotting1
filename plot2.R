# Read in "Household Power Consumption" data file

dataFile <- "./household_power_consumption.txt"
data <- read.table (dataFile, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

# Subset two days of data (Feb 1 and 2, 2007)

subset1 <- data [data$Date %in% c("1/2/2007", "2/2/2007") ,]

# Change class of columns as required

subset1$Date <- as.Date (subset1$Date, format = "%d/%m/%Y")
subset1$Time <- format (subset1$Time, format = "%H:%M:%S")
subset1$Global_active_power <- as.numeric (subset1$Global_active_power)

# Create column in table with date and time merged together

datetime1 <- paste(subset1$Date, subset1$Time)
datetime2 <- as.POSIXct(datetime1)
subset2 <- cbind(subset1, datetime2)

# Create plot and print to png

png("plot2.png", width = 480, height = 480)
with(subset2, plot(datetime2, Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)"))
dev.off()
