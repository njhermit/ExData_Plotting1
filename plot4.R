# Read in the dataset
dt <- read.csv("household_power_consumption.txt", header=T, sep=';', 
               na.strings="?")
# Subset the dataset
st <- subset(dt, Date == "1/2/2007"|Date == "2/2/2007")

# Convert the data and time
st$Datetime <- strptime(paste(st$Date, st$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Combine four plots in one graph
par(mfrow=c(2,2))
plot(st$Datetime, st$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(st$Datetime, st$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(st$Datetime, st$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(st$Datetime, st$Sub_metering_2, type="l", col="red")
lines(st$Datetime, st$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(st$Datetime, st$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

## Save to png file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()