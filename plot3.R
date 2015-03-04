# The following preamable is shared between the plots. Normally I'd consider factoring this out and 
# sharing it between plots, but given the format of the assignment I don't want to cause confusion

projData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, na.strings="?")
# Repurpose Time field as a Date and Time field since strptime gives as a Date/Time object anyway
# The resulting times are in the local timezone, but we treat them as naive times and ignore that.
dtFormat <- "%d/%m/%Y %H:%M:%S"
projData$Time <- strptime(paste(projData$Date, projData$Time), format=dtFormat)

startTime = strptime("01/02/2007 00:00:00", format=dtFormat)
stopTime = strptime("02/02/2007 23:59:59", format=dtFormat)
subset = projData[(projData$Time >= startTime) & (projData$Time <= stopTime),]

# Plot specific code.

png("plot3.png")
plot(subset$Time, subset$Sub_metering_1, ylab="Energy sub metering", main="", xlab="", type="l")
points(subset$Time, subset$Sub_metering_2, type="l", col="red")
points(subset$Time, subset$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)

dev.off()
