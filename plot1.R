## LOAD THE DATA.
# Set the working directory.
setwd("C:\\Users\\Hamish\\Documents\\Educational Materials\\Coursera Data Science\\Course 4")
# Import the data.
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
# Convert the dates to proper R dates.
temp <- as.Date(data$Date, format = "%d/%m/%Y")  # Capital Y since it's a 4-digit year.
# Find the rows with the proper dates.
indices <- temp=="2007-2-1" | temp=="2007-2-2"
# Restrict the data to the relevant dates.
dataSmall <- data[indices,]

# OPEN A .PNG FILE
png(file="plot1.png")

## CREATE THE GRAPH
# The variable dataSmall$Global_active_power is a "factor", so we need to convert the data to numbers.
xdata <- as.numeric(levels(dataSmall$Global_active_power))[dataSmall$Global_active_power]
# Produce the histogram.
hist(xdata, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

# TURN OFF THE .PNG DEVICE.
#dev.copy(png, file = "plot1.png") # THis is an alternative to what I did, but it doesn't work as well.
dev.off()




