# The following preamable is shared between the plots. Normally I'd consider factoring this out and 
# sharing it between plots, but given the format of the assignment I don't want to cause confusion

projData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)
# Repurpose Time field as a Date and Time field since strptime gives as a Date/Time object anyway
# The resulting times are in the local timezone, but we treat them as naive times and ignore that.
dtFormat <- "%d/%m/%Y %H:%M:%S"
projData$Time <- strptime(paste(projData$Date, projData$Time), format=dtFormat)

startTime = strptime("01/02/2007 00:00:00", format=dtFormat)
stopTime = strptime("02/02/2007 23:59:59", format=dtFormat)
subset = projData[(projData$Time >= startTime) & (projData$Time <= stopTime),]

subset$Global_active_power = as.numeric(subset$Global_active_power)
subset$Sub_metering_1 = as.numeric(subset$Sub_metering_1)
subset$Sub_metering_2 = as.numeric(subset$Sub_metering_2)
subset$Sub_metering_3 = as.numeric(subset$Sub_metering_3)
subset$Voltage = as.numeric(subset$Voltage)
subset$Global_reactive_power = as.numeric(subset$Global_reactive_power)

# Plot specific code.

png("plot2.png")
plot(subset$Time, subset$Global_active_power, ylab="Global Active Power (kilowatts)", main="", xlab="", type="l")
dev.off()
