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
png(file="plot3.png")

## CREATE THE GRAPH
# Combine the date and time information.
temp <- paste(dataSmall$Date,dataSmall$Time)
# Convert the date/time to numbers.
xdata <- as.numeric(strptime(temp,"%d/%m/%Y %H:%M:%S"))
# The variables dataSmall$Sub_metering_1 and dataSmall$Sub_metering_2 are "factor"s, so we need to convert the data to numbers.
y1data <- as.numeric(levels(dataSmall$Sub_metering_1))[dataSmall$Sub_metering_1]
y2data <- as.numeric(levels(dataSmall$Sub_metering_2))[dataSmall$Sub_metering_2]
y3data <- dataSmall$Sub_metering_3
# Plot the data but leave the labels off.
plot(xdata,y1data, type="l", axes=FALSE, ann=FALSE)
lines(xdata,y2data, type="l", col="red")
lines(xdata,y3data, type="l", col="blue")
# Create and label the axes.
xlabeldata <- as.numeric(strptime(c("1/2/2007 00:00:00","2/2/2007 00:00:00","3/2/2007 00:00:00"),"%d/%m/%Y %H:%M:%S"))
axis(1, at=xlabeldata, lab=c("Thu","Fri","Sat"))
axis(2, at=c(0,10,20,30))
title(xlab="")
title(ylab="Energy sub metering")
# Create the legend.
legend("topright", lty=c(1,1,1), col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# TURN OFF THE .PNG DEVICE.
#dev.copy(png, file = "plot3.png") # THis is an alternative to what I did, but it doesn't work as well.
dev.off()

