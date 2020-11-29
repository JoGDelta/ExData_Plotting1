# Read in "Household Power Consumption" data file

dataFile <- "./household_power_consumption.txt"
data <- read.table (dataFile, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

# Subset two days of data (Feb 1 and 2, 2007)

subset1 <- data [data$Date %in% c("1/2/2007", "2/2/2007") ,]

# Change class of columns as required

subset1$Global_active_power <- as.numeric (subset1$Global_active_power)

# Create histogram and print to png

png("plot1.png", width = 480, height = 480)
hist(subset1$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()