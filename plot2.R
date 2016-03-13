## LOAD THE DATA.
# Set the working directory.
#setwd("C:\\Users\\Hamish\\Documents\\Educational Materials\\Coursera Data Science\\Course 4")
# Import the data.
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
# Convert the dates to proper R dates.
temp <- as.Date(data$Date, format = "%d/%m/%Y")  # Capital Y since it's a 4-digit year.
# Find the rows with the proper dates.
indices <- temp=="2007-2-1" | temp=="2007-2-2"
# Restrict the data to the relevant dates.
dataSmall <- data[indices,]

# OPEN A .PNG FILE
png(file="plot2.png")

## CREATE THE GRAPH
# Combine the date and time information.
temp <- paste(dataSmall$Date,dataSmall$Time)
# Convert the date/time to numbers.
xdata <- as.numeric(strptime(temp,"%d/%m/%Y %H:%M:%S"))
# The variable dataSmall$Global_active_power is a "factor", so we need to convert the data to numbers.
ydata <- as.numeric(levels(dataSmall$Global_active_power))[dataSmall$Global_active_power]
# Plot the data but leave the labels off.
plot(xdata,ydata, type="l", axes=FALSE, ann=FALSE)
# Create and label the axes.
xlabeldata <- as.numeric(strptime(c("1/2/2007 00:00:00","2/2/2007 00:00:00","3/2/2007 00:00:00"),"%d/%m/%Y %H:%M:%S"))
axis(1, at=xlabeldata, lab=c("Thu","Fri","Sat"))
axis(2, at=c(0,2,4,6))
title(xlab="")
title(ylab="Global Active Power (kilowatts)")

# TURN OFF THE .PNG DEVICE.
#dev.copy(png, file = "plot2.png") # THis is an alternative to what I did, but it doesn't work as well.
dev.off()