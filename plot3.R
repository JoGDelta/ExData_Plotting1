# Read in "Household Power Consumption" data file

dataFile <- "./household_power_consumption.txt"
data <- read.table (dataFile, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

# Subset two days of data (Feb 1 and 2, 2007)

subset1 <- data [data$Date %in% c("1/2/2007", "2/2/2007") ,]

# Change class of columns as required

subset1$Date <- as.Date (subset1$Date, format = "%d/%m/%Y")
subset1$Time <- format (subset1$Time, format = "%H:%M:%S")
subset1$Global_active_power <- as.numeric (subset1$Global_active_power)
subset1$Sub_metering_1 <- as.numeric (subset1$Sub_metering_1)
subset1$Sub_metering_2 <- as.numeric (subset1$Sub_metering_2)
subset1$Sub_metering_3 <- as.numeric (subset1$Sub_metering_3)

# Create column in table with date and time merged together

datetime1 <- paste(subset1$Date, subset1$Time)
datetime2 <- as.POSIXct(datetime1)
subset2 <- cbind(subset1, datetime2)

# Create plot and print to png

png("plot3.png", width = 480, height = 480)
with(subset2, plot(datetime2, Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering"))
lines (subset2$datetime2, subset2$Sub_metering_2, type = "l", col = "red")
lines (subset2$datetime2, subset2$Sub_metering_3, type = "l", col = "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col = c("black", "red", "blue"))
dev.off()